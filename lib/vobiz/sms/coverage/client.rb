# frozen_string_literal: true

module Vobiz
  module Sms
    module Coverage
      class Client
        # @param client [Vobiz::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns one summary row per destination country, sorted by country name: the sender types it accepts, whether
        # sender registration is required, two-way support, opt-out rules and whether a sending window applies. Use it
        # to plan where to send and which sender to use before you buy numbers or register. Filters combine, so `region`
        # plus `twoWay=true` returns only two-way countries in that region. For the full record of one country, call
        # `GET /coverage/{country}`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :q
        # @option params [String, nil] :region
        # @option params [Boolean, nil] :two_way
        # @option params [Boolean, nil] :registration_required
        #
        # @return [Vobiz::Sms::Types::CoverageList]
        def list_coverage(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["q"] = params[:q] if params.key?(:q)
          query_params["region"] = params[:region] if params.key?(:region)
          query_params["twoWay"] = params[:two_way] if params.key?(:two_way)
          query_params["registrationRequired"] = params[:registration_required] if params.key?(:registration_required)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/coverage",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::CoverageList.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns the full coverage record for one country: accepted sender types, registration requirements and lead
        # time, link rules, prohibited topics, the permitted sending window and free-text market notes. Read it before
        # your first send to a new country so your sender, content and send times match the local rules. An unknown code
        # returns `404` with `country not found`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :country
        #
        # @return [Vobiz::Sms::Types::CoverageDetail]
        def get_coverage(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/coverage/#{URI.encode_uri_component(params[:country].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::CoverageDetail.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
