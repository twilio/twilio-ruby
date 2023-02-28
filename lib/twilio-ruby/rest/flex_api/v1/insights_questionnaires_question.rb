##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Flex
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class FlexApi < FlexApiBase
            class V1 < Version
                class InsightsQuestionnairesQuestionList < ListResource
                    ##
                    # Initialize the InsightsQuestionnairesQuestionList
                    # @param [Version] version Version that contains the resource
                    # @return [InsightsQuestionnairesQuestionList] InsightsQuestionnairesQuestionList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Insights/QM/Questions"
                        
                    end
                    ##
                    # Create the InsightsQuestionnairesQuestionInstance
                    # @param [String] category_id The ID of the category
                    # @param [String] question The question.
                    # @param [String] description The description for the question.
                    # @param [String] answer_set_id The answer_set for the question.
                    # @param [Boolean] allow_na The flag to enable for disable NA for answer.
                    # @param [String] token The Token HTTP request header
                    # @return [InsightsQuestionnairesQuestionInstance] Created InsightsQuestionnairesQuestionInstance
                    def create(
                        category_id: nil, 
                        question: nil, 
                        description: nil, 
                        answer_set_id: nil, 
                        allow_na: nil, 
                        token: :unset
                    )

                        data = Twilio::Values.of({
                            'CategoryId' => category_id,
                            'Question' => question,
                            'Description' => description,
                            'AnswerSetId' => answer_set_id,
                            'AllowNa' => allow_na,
                        })

                        headers = Twilio::Values.of({ 'Token' => token, })
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        InsightsQuestionnairesQuestionInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists InsightsQuestionnairesQuestionInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] token The Token HTTP request header
                    # @param [Array[String]] category_id The list of category IDs
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(token: :unset, category_id: :unset, limit: nil, page_size: nil)
                        self.stream(
                            token: token,
                            category_id: category_id,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] token The Token HTTP request header
                    # @param [Array[String]] category_id The list of category IDs
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(token: :unset, category_id: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            token: token,
                            category_id: category_id,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields InsightsQuestionnairesQuestionInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of InsightsQuestionnairesQuestionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] token The Token HTTP request header
                    # @param [Array[String]] category_id The list of category IDs
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of InsightsQuestionnairesQuestionInstance
                    def page(token: :unset, category_id: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'Token' => token,
                            
                            'CategoryId' =>  Twilio.serialize_list(category_id),
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        InsightsQuestionnairesQuestionPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of InsightsQuestionnairesQuestionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of InsightsQuestionnairesQuestionInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    InsightsQuestionnairesQuestionPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.InsightsQuestionnairesQuestionList>'
                    end
                end

                ##
                #PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
                class InsightsQuestionnairesQuestionContext < InstanceContext
                    ##
                    # Initialize the InsightsQuestionnairesQuestionContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] question_id The unique ID of the question
                    # @return [InsightsQuestionnairesQuestionContext] InsightsQuestionnairesQuestionContext
                    def initialize(version, question_id)
                        super(version)

                        # Path Solution
                        @solution = { question_id: question_id,  }
                        @uri = "/Insights/QM/Questions/#{@solution[:question_id]}"

                        
                    end
                    ##
                    # Delete the InsightsQuestionnairesQuestionInstance
                    # @param [String] token The Token HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        token: :unset
                    )

                        headers = Twilio::Values.of({ 'Token' => token, })
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Update the InsightsQuestionnairesQuestionInstance
                    # @param [Boolean] allow_na The flag to enable for disable NA for answer.
                    # @param [String] category_id The ID of the category
                    # @param [String] question The question.
                    # @param [String] description The description for the question.
                    # @param [String] answer_set_id The answer_set for the question.
                    # @param [String] token The Token HTTP request header
                    # @return [InsightsQuestionnairesQuestionInstance] Updated InsightsQuestionnairesQuestionInstance
                    def update(
                        allow_na: nil, 
                        category_id: :unset, 
                        question: :unset, 
                        description: :unset, 
                        answer_set_id: :unset, 
                        token: :unset
                    )

                        data = Twilio::Values.of({
                            'AllowNa' => allow_na,
                            'CategoryId' => category_id,
                            'Question' => question,
                            'Description' => description,
                            'AnswerSetId' => answer_set_id,
                        })

                        headers = Twilio::Values.of({ 'Token' => token, })
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        InsightsQuestionnairesQuestionInstance.new(
                            @version,
                            payload,
                            question_id: @solution[:question_id],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InsightsQuestionnairesQuestionContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InsightsQuestionnairesQuestionContext #{context}>"
                    end
                end

                class InsightsQuestionnairesQuestionPage < Page
                    ##
                    # Initialize the InsightsQuestionnairesQuestionPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [InsightsQuestionnairesQuestionPage] InsightsQuestionnairesQuestionPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of InsightsQuestionnairesQuestionInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [InsightsQuestionnairesQuestionInstance] InsightsQuestionnairesQuestionInstance
                    def get_instance(payload)
                        InsightsQuestionnairesQuestionInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.InsightsQuestionnairesQuestionPage>'
                    end
                end
                class InsightsQuestionnairesQuestionInstance < InstanceResource
                    ##
                    # Initialize the InsightsQuestionnairesQuestionInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this InsightsQuestionnairesQuestion
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [InsightsQuestionnairesQuestionInstance] InsightsQuestionnairesQuestionInstance
                    def initialize(version, payload , question_id: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'question_id' => payload['question_id'],
                            'question' => payload['question'],
                            'description' => payload['description'],
                            'category' => payload['category'],
                            'answer_set_id' => payload['answer_set_id'],
                            'allow_na' => payload['allow_na'],
                            'usage' => payload['usage'] == nil ? payload['usage'] : payload['usage'].to_i,
                            'answer_set' => payload['answer_set'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'question_id' => question_id  || @properties['question_id']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [InsightsQuestionnairesQuestionContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = InsightsQuestionnairesQuestionContext.new(@version , @params['question_id'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Insights resource and owns this resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique ID of the question
                    def question_id
                        @properties['question_id']
                    end
                    
                    ##
                    # @return [String] The question.
                    def question
                        @properties['question']
                    end
                    
                    ##
                    # @return [String] The description for the question.
                    def description
                        @properties['description']
                    end
                    
                    ##
                    # @return [Hash] The Category for the question.
                    def category
                        @properties['category']
                    end
                    
                    ##
                    # @return [String] The answer_set for the question.
                    def answer_set_id
                        @properties['answer_set_id']
                    end
                    
                    ##
                    # @return [Boolean] The flag  to enable for disable NA for answer.
                    def allow_na
                        @properties['allow_na']
                    end
                    
                    ##
                    # @return [String] Integer value that tells a particular question is used by how many questionnaires
                    def usage
                        @properties['usage']
                    end
                    
                    ##
                    # @return [Hash] Set of answers for the question
                    def answer_set
                        @properties['answer_set']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the InsightsQuestionnairesQuestionInstance
                    # @param [String] token The Token HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        token: :unset
                    )

                        context.delete(
                            token: token, 
                        )
                    end

                    ##
                    # Update the InsightsQuestionnairesQuestionInstance
                    # @param [Boolean] allow_na The flag to enable for disable NA for answer.
                    # @param [String] category_id The ID of the category
                    # @param [String] question The question.
                    # @param [String] description The description for the question.
                    # @param [String] answer_set_id The answer_set for the question.
                    # @param [String] token The Token HTTP request header
                    # @return [InsightsQuestionnairesQuestionInstance] Updated InsightsQuestionnairesQuestionInstance
                    def update(
                        allow_na: nil, 
                        category_id: :unset, 
                        question: :unset, 
                        description: :unset, 
                        answer_set_id: :unset, 
                        token: :unset
                    )

                        context.update(
                            allow_na: allow_na, 
                            category_id: category_id, 
                            question: question, 
                            description: description, 
                            answer_set_id: answer_set_id, 
                            token: token, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InsightsQuestionnairesQuestionInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InsightsQuestionnairesQuestionInstance #{values}>"
                    end
                end
            end
        end
    end
end
