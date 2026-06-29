# frozen_string_literal: true

module Vobiz
  module SubAccountKycTestMode
    class Client
      # @param client [Vobiz::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Mock PAN verification — never hits the provider. Magic `pan` inputs:
      #
      # | Input | Outcome |
      # |---|---|
      # | `TESTSUCCESS0001` | verified |
      # | `TESTFAIL0001` | failed |
      # | `TESTERROR0001` | HTTP 500 |
      # | `TESTPENDING001` | pending (finalize as verified) |
      # | `TESTPENDING_FAIL` | pending (finalize as failed) |
      #
      # Persists a real `kyc_verifications` row and recomputes `kyc_status`.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKycTestMode::Types::MockVerifySubaccountPanRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Vobiz::Types::KycVerificationResult]
      def mock_verify_subaccount_pan(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKycTestMode::Types::MockVerifySubaccountPanRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/test/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/verify-pan",
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

      # Mock GST verification. Same magic-input matrix as [Mock verify PAN](#operation/mock-verify-subaccount-pan).
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKycTestMode::Types::MockVerifySubaccountGstRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Vobiz::Types::KycVerificationResult]
      def mock_verify_subaccount_gst(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKycTestMode::Types::MockVerifySubaccountGstRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/test/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/verify-gst",
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

      # Returns deterministic fake company matches.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKycTestMode::Types::MockSearchSubaccountCinRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Object]
      def mock_search_subaccount_cin(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKycTestMode::Types::MockSearchSubaccountCinRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/test/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/cin/search",
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

      # Succeeds when `selected_cin` starts with `U72900KA2024PTC123456`.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKycTestMode::Types::MockConfirmSubaccountCinRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Vobiz::Types::KycVerificationResult]
      def mock_confirm_subaccount_cin(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKycTestMode::Types::MockConfirmSubaccountCinRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/test/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/cin/confirm",
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

      # Returns a deterministic `access_request_id`.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKycTestMode::Types::MockSubaccountDigilockerInitiateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Object]
      def mock_subaccount_digilocker_initiate(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKycTestMode::Types::MockSubaccountDigilockerInitiateRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/test/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/digilocker/initiate",
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

      # `access_request_id` `MOCK_AR_SUCCESS` → verified; `MOCK_AR_FAIL` → failed.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKycTestMode::Types::MockSubaccountDigilockerVerifyRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Vobiz::Types::KycVerificationResult]
      def mock_subaccount_digilocker_verify(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKycTestMode::Types::MockSubaccountDigilockerVerifyRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/test/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/digilocker/verify",
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

      # Promotes the most recent **pending** mock verification of the given
      # type to a terminal outcome — this drives the async (`TESTPENDING…`)
      # path without webhooks. `verification_type` ∈ `pan | aadhaar | gst | cin`;
      # `outcome` ∈ `verified | failed`.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::SubAccountKycTestMode::Types::MockFinalizePendingKycRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sub_auth_id
      #
      # @return [Vobiz::Types::KycVerificationResult]
      def mock_finalize_pending_kyc(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::SubAccountKycTestMode::Types::MockFinalizePendingKycRequest.new(params).to_h
        non_body_param_names = %w[sub_auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/sub-accounts/test/#{URI.encode_uri_component(params[:sub_auth_id].to_s)}/kyc/finalize-pending",
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
    end
  end
end
