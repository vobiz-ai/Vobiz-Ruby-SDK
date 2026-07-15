# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    class Client
      # @param client [Vobiz::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns the authenticated partner's profile and balance.
      #
      # @param request_options [Hash]
      # @param _params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vobiz::PartnerAPI::Types::GetPartnerProfileResponse]
      def get_partner_profile(request_options: {}, **_params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/partner/me",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::PartnerAPI::Types::GetPartnerProfileResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Aggregated partner metrics - total customers, active accounts, balance
      # held across the partner ecosystem, MTD revenue, etc.
      #
      # @param request_options [Hash]
      # @param _params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vobiz::PartnerAPI::Types::GetPartnerDashboardResponse]
      def get_partner_dashboard(request_options: {}, **_params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/partner/dashboard",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::PartnerAPI::Types::GetPartnerDashboardResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns all customer sub-accounts under your partner account.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :per_page
      # @option params [String, nil] :search
      #
      # @return [Vobiz::PartnerAPI::Types::ListCustomerAccountsResponse]
      def list_customer_accounts(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["per_page"] = params[:per_page] if params.key?(:per_page)
        query_params["search"] = params[:search] if params.key?(:search)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/partner/accounts",
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
          Vobiz::PartnerAPI::Types::ListCustomerAccountsResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a new customer sub-account under your partner account. VoBiz
      # emails the customer their login credentials and (separately) a KYC link
      # via the kyc-sessions endpoint.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::PartnerAPI::Types::CreateCustomerAccountRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Object]
      def create_customer_account(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/partner/accounts",
          body: Vobiz::PartnerAPI::Types::CreateCustomerAccountRequest.new(params).to_h,
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

      # Atomically debits your partner master balance and credits the customer's
      # wallet. Both legs are recorded in each account's ledger. Transfers are
      # **permanent and cannot be reversed.**
      #
      # @param request_options [Hash]
      # @param params [Vobiz::PartnerAPI::Types::PartnerTransferBalanceRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :customer_auth_id
      #
      # @return [Object]
      def partner_transfer_balance(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::PartnerAPI::Types::PartnerTransferBalanceRequest.new(params).to_h
        non_body_param_names = %w[customer_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/partner/accounts/#{URI.encode_uri_component(params[:customer_auth_id].to_s)}/transfer-balance",
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

      # Returns the customer's transaction ledger. Filter by date range or
      # transaction type. Useful for billing reconciliation.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :customer_auth_id
      # @option params [String, nil] :from_date
      # @option params [String, nil] :to_date
      # @option params [Vobiz::PartnerAPI::Types::ListCustomerTransactionsRequestTransactionType, nil] :transaction_type
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :per_page
      #
      # @return [Vobiz::PartnerAPI::Types::ListCustomerTransactionsResponse]
      def list_customer_transactions(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["from_date"] = params[:from_date] if params.key?(:from_date)
        query_params["to_date"] = params[:to_date] if params.key?(:to_date)
        query_params["transaction_type"] = params[:transaction_type] if params.key?(:transaction_type)
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["per_page"] = params[:per_page] if params.key?(:per_page)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/partner/accounts/#{URI.encode_uri_component(params[:customer_auth_id].to_s)}/transactions",
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
          Vobiz::PartnerAPI::Types::ListCustomerTransactionsResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Look up any customer's call history. Same filter set as the
      # customer-side CDR endpoint.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :customer_auth_id
      # @option params [String, nil] :start_date
      # @option params [String, nil] :end_date
      # @option params [Vobiz::PartnerAPI::Types::ListCustomerCdrsRequestCallDirection, nil] :call_direction
      # @option params [Vobiz::PartnerAPI::Types::ListCustomerCdrsRequestStatus, nil] :status
      # @option params [Integer, nil] :min_duration
      # @option params [String, nil] :hangup_cause
      # @option params [Integer, nil] :per_page
      #
      # @return [Vobiz::PartnerAPI::Types::ListCustomerCdrsResponse]
      def list_customer_cdrs(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["start_date"] = params[:start_date] if params.key?(:start_date)
        query_params["end_date"] = params[:end_date] if params.key?(:end_date)
        query_params["call_direction"] = params[:call_direction] if params.key?(:call_direction)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["min_duration"] = params[:min_duration] if params.key?(:min_duration)
        query_params["hangup_cause"] = params[:hangup_cause] if params.key?(:hangup_cause)
        query_params["per_page"] = params[:per_page] if params.key?(:per_page)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/partner/accounts/#{URI.encode_uri_component(params[:customer_auth_id].to_s)}/cdrs",
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
          Vobiz::PartnerAPI::Types::ListCustomerCdrsResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Phone numbers currently assigned to a customer account.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :customer_auth_id
      # @option params [String, nil] :search
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :per_page
      #
      # @return [Vobiz::PartnerAPI::Types::ListCustomerNumbersResponse]
      def list_customer_numbers(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["search"] = params[:search] if params.key?(:search)
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["per_page"] = params[:per_page] if params.key?(:per_page)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/partner/accounts/#{URI.encode_uri_component(params[:customer_auth_id].to_s)}/numbers",
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
          Vobiz::PartnerAPI::Types::ListCustomerNumbersResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the authenticated partner's KYC sessions. Filter the list by
      # session status or customer account, and use `page` and `size` to
      # paginate the results.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Vobiz::PartnerAPI::Types::ListKycSessionsRequestStatus, nil] :status
      # @option params [String, nil] :account_auth_id
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :size
      #
      # @return [Vobiz::PartnerAPI::Types::ListKycSessionsResponse]
      def list_kyc_sessions(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["account_auth_id"] = params[:account_auth_id] if params.key?(:account_auth_id)
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["size"] = params[:size] if params.key?(:size)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/partner/kyc-sessions",
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
          Vobiz::PartnerAPI::Types::ListKycSessionsResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Triggers VoBiz to email a KYC link to the customer. KYC is OTP-based
      # (PAN + Aadhaar via DigiLocker for individuals, PAN + GSTIN for
      # companies). No document uploads required.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::PartnerAPI::Types::CreateKycSessionRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Object]
      def create_kyc_session(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/partner/kyc-sessions",
          body: Vobiz::PartnerAPI::Types::CreateKycSessionRequest.new(params).to_h,
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

      # Returns the current status and available details for one KYC session
      # owned by the authenticated partner.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :session_id
      #
      # @return [untyped]
      def get_kyc_session(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/partner/kyc-sessions/#{URI.encode_uri_component(params[:session_id].to_s)}",
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

      # Cancels an outstanding KYC session. Customer can no longer use the link.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::PartnerAPI::Types::RevokeKycSessionRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :session_id
      #
      # @return [Object]
      def revoke_kyc_session(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::PartnerAPI::Types::RevokeKycSessionRequest.new(params).to_h
        non_body_param_names = %w[session_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "api/v1/partner/kyc-sessions/#{URI.encode_uri_component(params[:session_id].to_s)}",
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

      # Re-dispatches the KYC link to the customer. Rate-limited to once per 30 minutes.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :session_id
      #
      # @return [untyped]
      def resend_kyc_session(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/partner/kyc-sessions/#{URI.encode_uri_component(params[:session_id].to_s)}/resend",
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
