# frozen_string_literal: true

module Vobiz
  module SubAccountKyc
    class Client
      # @param client [Vobiz::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns the aggregated KYC state for a `customer_use` sub-account —
      # which verifications have passed, whether calls are still blocked, and
      # the business type. The caller must be the parent main account that owns
      # the sub-account (or an admin).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Vobiz::Types::SubAccountKycStatus]
      def get_subaccount_kyc_status(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/sub-accounts/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/status",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Types::SubAccountKycStatus.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Runs a real PAN verification (Perfios) for the sub-account. `pan` must
      # be exactly 10 characters. Persists a `kyc_verifications` row and
      # recomputes the sub-account's aggregated `kyc_status`.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKyc::Types::VerifySubaccountPanRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Vobiz::Types::KycVerificationResult]
      def verify_subaccount_pan(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKyc::Types::VerifySubaccountPanRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/verify-pan",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Types::KycVerificationResult.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Runs a real GSTIN verification. `gstin` must be a 15-character GSTIN.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKyc::Types::VerifySubaccountGstRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Vobiz::Types::KycVerificationResult]
      def verify_subaccount_gst(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKyc::Types::VerifySubaccountGstRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/verify-gst",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Types::KycVerificationResult.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Name-based CIN lookup. Returns candidate company matches; pick one and
      # pass it to [CIN confirm](#operation/confirm-subaccount-cin).
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKyc::Types::SearchSubaccountCinRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Object]
      def search_subaccount_cin(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKyc::Types::SearchSubaccountCinRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/cin/search",
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

      # Confirm the CIN selected from the search results.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKyc::Types::ConfirmSubaccountCinRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Vobiz::Types::KycVerificationResult]
      def confirm_subaccount_cin(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKyc::Types::ConfirmSubaccountCinRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/cin/confirm",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Types::KycVerificationResult.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the DigiLocker authorization link and an `access_request_id`.
      # The customer completes the OAuth flow on the DigiLocker portal, after
      # which you finalize with
      # [DigiLocker verify](#operation/subaccount-digilocker-verify).
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKyc::Types::SubaccountDigilockerInitiateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Object]
      def subaccount_digilocker_initiate(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKyc::Types::SubaccountDigilockerInitiateRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/digilocker/initiate",
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

      # Finalize Aadhaar via DigiLocker after the customer completes OAuth.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKyc::Types::SubaccountDigilockerVerifyRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Vobiz::Types::KycVerificationResult]
      def subaccount_digilocker_verify(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKyc::Types::SubaccountDigilockerVerifyRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/digilocker/verify",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Types::KycVerificationResult.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a Vobiz-hosted KYC session for the sub-account. With
      # `flow_type=email` (default) Vobiz emails the customer a signed link
      # (from `kyc@vobiz.ai`, hosted at `kyc.vobiz.ai`) and `customer_email` is
      # required. With `flow_type=redirect`, omit `customer_email`, pass a
      # `redirect_url`, and the `widget_url` is returned directly for an inline
      # redirect.
      #
      # This is the sub-account–scoped equivalent of the partner-level
      # [KYC Sessions](/partner/api/kyc-sessions) endpoint.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKyc::Types::CreateSubaccountKycSessionRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Object]
      def create_subaccount_kyc_session(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKyc::Types::CreateSubaccountKycSessionRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc-sessions",
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
    end
  end
end
