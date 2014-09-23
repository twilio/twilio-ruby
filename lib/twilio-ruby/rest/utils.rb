module Twilio
  module REST
    module Utils

      def twilify(something)
        if something.is_a? Hash
          something = something.to_a
          something = something.map { |a| [twilify(a[0]).to_sym, a[1]] }
          something = something.flatten(1)
          Hash[*something]
        else
          something.to_s.split('_').map! do |s|
            [s[0,1].capitalize, s[1..-1]].join
          end.join
        end
      end

      def detwilify(something)
        if something.is_a? Hash
          something = *something.to_a
          something.map! { |pair| [detwilify(pair[0]).to_sym, pair[1]] }
          something = something.flatten
          Hash[something]
        else
          something = something.to_s
          something = something.gsub(/[A-Z][a-z]*/) { |s| "_#{s.downcase}" }
          something.gsub(/^_/, '')
        end
      end

    end
  end
end
