# frozen_string_literal: true

module Vobiz
  module Sms
    module Numbers
      class Client
        # @param client [Vobiz::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns every number on your account that is routed for SMS or MMS, sorted by `countryCode` and then `e164`.
        # Each number carries its US registration state, the last message it sent and a `sendable` summary of where it
        # can send right now. Check `sendable.usDomestic` before you send to US recipients from a US number. To add
        # numbers, search with `GET /numbers/available` and buy with `POST /numbers/purchase`.
        #
        # @param request_options [Hash]
        # @param _params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::SmsNumberList]
        def list_numbers(request_options: {}, **_params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/numbers",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::SmsNumberList.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns the countries where you can buy messaging numbers, with the number types and capabilities in stock in
        # each. The list is a snapshot that refreshes in the background: while `ready` is `false`, `countries` is empty
        # and you retry shortly. India is not listed, because traffic to Indian recipients is sent from DLT-registered
        # sender IDs. Pass a returned `country` to `GET /numbers/available` to see individual numbers.
        #
        # @param request_options [Hash]
        # @param _params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::NumberCountries]
        def list_countries(request_options: {}, **_params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/numbers/countries",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::NumberCountries.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Searches the inventory for numbers you can buy in one country, with their setup and monthly prices in your
        # wallet currency. Each search returns up to 10 numbers. Pass the chosen `e164`, the `country` and any non-empty
        # `numberKey` to `POST /numbers/purchase`. For `country=IN` the list is empty and `hint` explains that Indian
        # traffic uses DLT-registered sender IDs. A country outside the set Vobiz sells numbers in returns `422`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :country
        # @option params [String, nil] :capabilities
        # @option params [String, nil] :area_code
        # @option params [Integer, nil] :limit
        #
        # @return [Vobiz::Sms::Types::AvailableNumbersResponse]
        def search_available_numbers(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["country"] = params[:country] if params.key?(:country)
          query_params["capabilities"] = params[:capabilities] if params.key?(:capabilities)
          query_params["areaCode"] = params[:area_code] if params.key?(:area_code)
          query_params["limit"] = params[:limit] if params.key?(:limit)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/numbers/available",
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
            Vobiz::Sms::Types::AvailableNumbersResponse.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Buys a number returned by `GET /numbers/available` and routes it to your account for messaging. This call
        # spends money: it debits the setup fee and the first month's rental from your wallet before the number is
        # bought, and the rental renews monthly until you release the number. If the purchase cannot complete after the
        # debit, your wallet is refunded and the error message says so. Run it only with your own credentials once you
        # have confirmed the number and price. A `numbers.updated` WebSocket event is published when the number goes
        # live; a US number then needs a 10DLC campaign or toll-free verification before it can send to US recipients.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Numbers::Types::PurchaseNumberRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::PurchaseNumberResponse]
        def purchase_number(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/numbers/purchase",
            body: Vobiz::Sms::Numbers::Types::PurchaseNumberRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::PurchaseNumberResponse.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns the numbers you have bought through Vobiz, newest first, each with its full list of wallet charges.
        # Released numbers stay in the list with `status: released`, so this is the billing history of every number you
        # have owned. Use `nextBillingAt` to see when each active number renews and `charges` to reconcile setup and
        # rental debits.
        #
        # @param request_options [Hash]
        # @param _params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::NumberPurchaseList]
        def list_purchases(request_options: {}, **_params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/numbers/purchases",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::NumberPurchaseList.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Cancels a number you bought through Vobiz and removes it from your account. The number stops sending and
        # receiving messages immediately, and monthly rental stops. The setup fee and the current month are not
        # refunded, and a released number cannot be restored. The call has no request body and returns the purchase with
        # `status: released`. Run it only with your own credentials once you are sure you no longer need the number.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :e164
        #
        # @return [Vobiz::Sms::Types::ReleaseNumberResponse]
        def release_number(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/numbers/#{URI.encode_uri_component(params[:e164].to_s)}/release",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::ReleaseNumberResponse.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
