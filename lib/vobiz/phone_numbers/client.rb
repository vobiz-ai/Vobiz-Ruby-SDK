# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    class Client
      # @param client [Vobiz::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # List all phone numbers on your account.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :per_page
      # @option params [String, nil] :search
      #
      # @return [Vobiz::PhoneNumbers::Types::ListNumbersResponse]
      def list_numbers(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["per_page"] = params[:per_page] if params.key?(:per_page)
        query_params["search"] = params[:search] if params.key?(:search)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/numbers",
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
          Vobiz::PhoneNumbers::Types::ListNumbersResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Release a phone number from your account.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :e164
      #
      # @return [untyped]
      def unrent_number(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/numbers/#{URI.encode_uri_component(params[:e164].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Browse available phone numbers in inventory that are not assigned to
      # any account. Only numbers with `status='active'` and `auth_id=NULL`
      # are returned. These numbers are ready to be purchased.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String, nil] :country
      # @option params [String, nil] :search
      # @option params [String, nil] :exclude
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :per_page
      #
      # @return [Vobiz::PhoneNumbers::Types::ListInventoryNumbersResponse]
      def list_inventory_numbers(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["country"] = params[:country] if params.key?(:country)
        query_params["search"] = params[:search] if params.key?(:search)
        query_params["exclude"] = params[:exclude] if params.key?(:exclude)
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["per_page"] = params[:per_page] if params.key?(:per_page)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/inventory/numbers",
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
          Vobiz::PhoneNumbers::Types::ListInventoryNumbersResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Purchase a phone number from inventory and assign it to your account.
      # Debits your account balance for the setup fee and monthly fee. For
      # sub-accounts (SA_), the parent master account (MA_) is charged.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::PhoneNumbers::Types::PurchaseFromInventoryRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      #
      # @return [Object]
      def purchase_from_inventory(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::PhoneNumbers::Types::PurchaseFromInventoryRequest.new(params).to_h
        non_body_param_names = %w[auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/numbers/purchase-from-inventory",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Assign a phone number to a specific SIP trunk. Once assigned, all
      # inbound calls to that phone number will be routed through the
      # designated trunk. The phone number must be URL-encoded; use `%2B`
      # instead of `+` (e.g., `%2B912271264217`).
      #
      # @param request_options [Hash]
      # @param params [Vobiz::PhoneNumbers::Types::AssignNumberToTrunkRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :phone_number
      #
      # @return [untyped]
      def assign_number_to_trunk(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::PhoneNumbers::Types::AssignNumberToTrunkRequest.new(params).to_h
        non_body_param_names = %w[auth_id phone_number]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/numbers/#{URI.encode_uri_component(params[:phone_number].to_s)}/assign",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Remove the assignment between a phone number and a SIP trunk. After
      # unassignment, the number remains in your account inventory but will
      # no longer route inbound calls through the previously assigned trunk.
      # URL-encode the phone number (use `%2B` instead of `+`).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :phone_number
      #
      # @return [untyped]
      def unassign_number_from_trunk(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/numbers/#{URI.encode_uri_component(params[:phone_number].to_s)}/assign",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Returns the health & analytics dashboard for one of your numbers: current
      # status, spam flag, and call metrics over the selected window (total and
      # answered calls, answer rate, minutes, average duration) plus a per-period
      # time series of snapshots.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :e164
      # @option params [Vobiz::PhoneNumbers::Types::GetNumberHealthRequestGranularity, nil] :granularity
      # @option params [Integer, nil] :days
      #
      # @return [Vobiz::PhoneNumbers::Types::GetNumberHealthResponse]
      def get_number_health(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["granularity"] = params[:granularity] if params.key?(:granularity)
        query_params["days"] = params[:days] if params.key?(:days)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/account/#{URI.encode_uri_component(params[:auth_id].to_s)}/numbers/#{URI.encode_uri_component(params[:e164].to_s)}/health",
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
          Vobiz::PhoneNumbers::Types::GetNumberHealthResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Assign a parent-pool DID to a sub-account.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::PhoneNumbers::Types::AssignDidToSubaccountRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :e164
      #
      # @return [untyped]
      def assign_did_to_subaccount(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::PhoneNumbers::Types::AssignDidToSubaccountRequest.new(params).to_h
        non_body_param_names = %w[auth_id e164]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/account/#{URI.encode_uri_component(params[:auth_id].to_s)}/numbers/#{URI.encode_uri_component(params[:e164].to_s)}/assign-subaccount",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Move the DID back to the parent pool.
      #
      # A **15-day cool-off** is enforced: if the DID had a call within the last
      # 15 days, the request is rejected with `409` and a
      # `did_cool_off_in_effect` error that includes `cool_off_until` and
      # `cool_off_remaining_seconds`. Never-used DIDs (`last_call_at` is `NULL`)
      # move back immediately.
      #
      # Admins can bypass the cool-off with `?force=true` (see below); the
      # bypass writes a `did_assignment_audit` row and requires an
      # admin-role account.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :e164
      # @option params [Boolean, nil] :force
      #
      # @return [untyped]
      def unassign_did_from_subaccount(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["force"] = params[:force] if params.key?(:force)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "api/v1/account/#{URI.encode_uri_component(params[:auth_id].to_s)}/numbers/#{URI.encode_uri_component(params[:e164].to_s)}/assign-subaccount",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end
    end
  end
end
