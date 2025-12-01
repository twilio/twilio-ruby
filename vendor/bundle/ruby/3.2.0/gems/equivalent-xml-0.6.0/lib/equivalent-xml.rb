require 'nokogiri'

module EquivalentXml

  class << self
    
    DEFAULT_OPTS = { :ignore_attr_values => false, :element_order => false, :normalize_whitespace => true }

    # Determine if two XML documents or nodes are equivalent
    #
    # @param [Nokogiri::XML::Node, Nokogiri::XML::NodeSet] node_1 The first top-level XML node to compare
    # @param [Nokogiri::XML::Node, Nokogiri::XML::NodeSet] node_2 The secton top-level XML node to compare
    # @param [Hash] opts Options that determine how certain comparisons are evaluated
    # @option opts [Boolean] :element_order (false) Child elements must occur in the same order to be considered equivalent
    # @option opts [Boolean] :normalize_whitespace (true) Collapse whitespace within Text nodes before comparing
    # @option opts [String, Array] :ignore_content (nil) CSS selector(s) of nodes for which the content (text and child nodes) should be ignored when comparing for equivalence
    # @yield [n1,n2,result] The two nodes currently being evaluated, and whether they are considered equivalent. The block can return true or false to override the default evaluation
    # @return [Boolean] true or false
    def equivalent?(node_1, node_2, opts = {}, &block)
      opts = DEFAULT_OPTS.merge(opts)
      if [node_1, node_2].any? { |node| node.is_a?(Nokogiri::XML::NodeSet)}
        self.compare_nodesets(as_nodeset(node_1, opts), as_nodeset(node_2, opts), opts, &block)
      else
        # Don't let one node to coerced to a DocumentFragment if the other one is a Document
        node_2 = Nokogiri::XML(node_2) if node_1.is_a?(Nokogiri::XML::Document) and !node_2.is_a?(Nokogiri::XML::Node)
        node_1 = Nokogiri::XML(node_1) if node_2.is_a?(Nokogiri::XML::Document) and !node_1.is_a?(Nokogiri::XML::Node)
        self.compare_nodes(as_node(node_1), as_node(node_2), opts, &block)
      end
    end

    def compare_nodes(node_1, node_2, opts, &block)
      result = nil
      if [node_1, node_2].any? { |node| not node.respond_to?(:node_type) }
        result = node_1.to_s == node_2.to_s
      elsif (node_1.class != node_2.class) or self.same_namespace?(node_1,node_2) == false
        result = false
      else
        case node_1.node_type
        when Nokogiri::XML::Node::DOCUMENT_NODE
          result = self.compare_documents(node_1,node_2,opts,&block)
        when Nokogiri::XML::Node::ELEMENT_NODE
          result = self.compare_elements(node_1,node_2,opts,&block)
        when Nokogiri::XML::Node::ATTRIBUTE_NODE
          result = self.compare_attributes(node_1,node_2,opts,&block)
        when Nokogiri::XML::Node::CDATA_SECTION_NODE
          result = self.compare_cdata(node_1,node_2,opts,&block)
        when Nokogiri::XML::Node::TEXT_NODE
          result = self.compare_text(node_1,node_2,opts,&block)
        else
          result = self.compare_children(node_1,node_2,opts,&block)
        end
      end
      if block_given?
        block_result = yield(node_1, node_2, result)
        if block_result.is_a?(TrueClass) or block_result.is_a?(FalseClass)
          result = block_result
        end
      end
      return result
    end

    def compare_documents(node_1, node_2, opts, &block)
      self.equivalent?(node_1.root,node_2.root,opts,&block)
    end
    
    def compare_elements(node_1, node_2, opts, &block)
      (node_1.name == node_2.name) && self.compare_children(node_1,node_2,opts,&block)
    end
    
    def compare_attributes(node_1, node_2, opts, &block)

      attr_names_match = node_1.name == node_2.name

      ignore_attrs = opts[ :ignore_attr_values ]

      if ignore_attrs && (ignore_attrs.empty? || ignore_attrs.include?( node_1.name ))
        attr_names_match
      else
        attr_names_match && (node_1.value == node_2.value)
      end
    end
    
    def compare_text(node_1, node_2, opts, &block)
      if opts[:normalize_whitespace]
        node_1.text.strip.gsub(/\s+/,' ') == node_2.text.strip.gsub(/\s+/,' ')
      else
        node_1.text == node_2.text
      end
    end
    
    def compare_cdata(node_1, node_2, opts, &block)
      node_1.text == node_2.text
    end
    
    def compare_children(node_1, node_2, opts, &block)
      if ignore_content?(node_1, opts)
        # Stop recursion and state a match on the children
        result = true
      else
        nodeset_1 = as_nodeset(node_1.children, opts)
        nodeset_2 = as_nodeset(node_2.children, opts)
        result = self.compare_nodesets(nodeset_1,nodeset_2,opts,&block)
      end
      
      if node_1.respond_to?(:attribute_nodes)
        attributes_1 = node_1.attribute_nodes
        attributes_2 = node_2.attribute_nodes
        result = result && self.compare_nodesets(attributes_1,attributes_2,opts,&block)
      end
      result
    end
    
    def compare_nodesets(nodeset_1, nodeset_2, opts, &block)
      local_set_1 = nodeset_1.dup
      local_set_2 = nodeset_2.dup
      
      if local_set_1.length != local_set_2.length
        return false
      end
    
      local_set_1.each do |search_node|
        found_node = local_set_2.find { |test_node| self.equivalent?(search_node,test_node,opts,&block) }

        if found_node.nil?
          return false
        else
          if search_node.is_a?(Nokogiri::XML::Element) and opts[:element_order]
            if search_node.parent.elements.index(search_node) != found_node.parent.elements.index(found_node)
              return false
            end
          end
          local_set_2.delete(found_node)
        end
      end
      return local_set_2.length == 0
    end

    # Determine if two nodes are in the same effective Namespace
    #
    # @param [Nokogiri::XML::Node OR String] node_1 The first node to test
    # @param [Nokogiri::XML::Node OR String] node_2 The second node to test
    def same_namespace?(node_1, node_2)
      args = [node_1,node_2]

      # CharacterData nodes shouldn't have namespaces. But in Nokogiri,
      # they do. And they're invisible. And they get corrupted easily.
      # So let's wilfully ignore them. And while we're at it, let's
      # ignore any class that doesn't know it has a namespace.
      if args.all? { |node| not node.respond_to?(:namespace) } or 
         args.any? { |node| node.is_a?(Nokogiri::XML::CharacterData) }
           return true
      end
      
      href1 = node_1.namespace.nil? ? '' : node_1.namespace.href
      href2 = node_2.namespace.nil? ? '' : node_2.namespace.href
      return href1 == href2
    end
    
    private
    def as_node(data)
      if data.respond_to?(:node_type)
        return data
      else
        result = Nokogiri::XML.fragment(data)
        if result.respond_to?(:root) && result.root.nil?
          return data
        else
          return result
        end
      end
    end
    
    def as_nodeset(data, opts = {})
      ignore_proc = lambda do |child|
        child.node_type == Nokogiri::XML::Node::COMMENT_NODE ||
        child.node_type == Nokogiri::XML::Node::PI_NODE ||
        (opts[:normalize_whitespace] && child.node_type == Nokogiri::XML::Node::TEXT_NODE && child.text.strip.empty?)
      end

      if data.is_a?(Nokogiri::XML::NodeSet)
        data.reject { |child| ignore_proc.call(child) }
      else
        result = Nokogiri::XML("<root>#{data}</root>")
        result.root.nil? ? data : result.root.children.reject { |child| ignore_proc.call(child) }
      end
    end

    def ignore_content?(node, opts = {})
      ignore_list = Array(opts[:ignore_content]).flatten.compact
      return false if ignore_list.empty?

      ignore_list.each do |selector|
        return true if node.document.css(selector).include?(node)
      end

      return false
    end
  end

end

if defined?(::RSpec::Matchers) or defined?(::Spec::Matchers)
  require 'equivalent-xml/rspec_matchers'
end
