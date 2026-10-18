# frozen_string_literal: true

module Vobiz
  module Sms
    module Brands
      class Client
        # @param client [Vobiz::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns every brand on your account as a bare JSON array, newest first. The list is not paginated and reads
        # the records stored on your account without contacting the registry; deleted brands are left out. Call `GET
        # /10dlc/brands/{id}` for the latest registry state of one brand.
        #
        # @param request_options [Hash]
        # @param _params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Array[Vobiz::Sms::Types::Brand]]
        def list_brands(request_options: {}, **_params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/10dlc/brands",
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

        # Creates a brand, the business identity that US carriers associate with your 10DLC traffic, and mirrors it to
        # the US 10DLC registry in `DRAFT` stage. `name` and `brandType` are required; send every other field your
        # business has, because the registry reviews them when you register. Nothing is submitted for review until you
        # call `POST /10dlc/brands/{id}/register`. Pass a `referenceId` so that a retried request (for example after a
        # `502`) reconciles to the same brand instead of creating a second one. Next, register the brand, then create a
        # campaign under it with `POST /10dlc/campaigns`.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Types::CreateBrandRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::Brand]
        def create_brand(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/brands",
            body: Vobiz::Sms::Types::CreateBrandRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Brand.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns one brand after refreshing its `stage`, `registrationStatus`, `brandIdentityStatus` and
        # `rejectionReasons` from the US 10DLC registry. The refresh is best-effort: if the registry is slow to answer,
        # you get the stored record and `lastSyncedAt` tells you how fresh it is. Poll this endpoint (or listen for the
        # `10dlc.brand.updated` WebSocket event) after registering to follow the review.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Brand]
        def get_brand(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/10dlc/brands/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Brand.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Replaces the brand with the body you send and pushes the change to the US 10DLC registry. This is a full
        # replacement, not a patch: send the same shape as create, including `name` and `brandType`, and any field you
        # leave out is cleared. `referenceId` is ignored on update. Use it to correct a brand before registering it, or
        # to fix the points listed in `rejectionReasons` before resubmitting.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Types::CreateBrandRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Brand]
        def update_brand(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[id]
          body_params = params.except(*path_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "api/v1/sms/10dlc/brands/#{URI.encode_uri_component(params[:id].to_s)}",
            body: Vobiz::Sms::Types::CreateBrandRequest.new(body_params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Brand.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes the brand from your account and from the US 10DLC registry and returns `204` with no body. A brand
        # that still owns campaigns returns `409` with `conflict: brand still has N campaign(s); delete them first`, so
        # delete or deregister its campaigns first. Deletion cannot be undone; a new brand needs a new registration.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [untyped]
        def delete_brand(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "api/v1/sms/10dlc/brands/#{URI.encode_uri_component(params[:id].to_s)}",
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

        # Submits the brand to the US 10DLC registry for identity verification. The brand moves from `DRAFT` to
        # `SUBMITTED` and `registrationStatus` starts tracking the registrar's decision (`PENDING`, then `ACTIVE` or
        # `REJECTED`). The request has no body and returns the refreshed brand. Submit only when the brand details are
        # final and you intend to register this business. Follow progress with `GET /10dlc/brands/{id}` or `GET
        # /10dlc/brands/{id}/registrar-statuses`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Brand]
        def register_brand(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/brands/#{URI.encode_uri_component(params[:id].to_s)}/register",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Brand.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns the brand's state at each registrar that has reviewed it, read live from the US 10DLC registry. Each
        # entry carries the registrar's `state` and, when the registrar reports them, the identity result, the
        # authentication status and a rejection reason. An empty array means no registrar has recorded a state yet. Use
        # it to see why a brand is pending or rejected.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Array[Vobiz::Sms::Types::BrandRegistrarStatus]]
        def brand_registrar_statuses(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/10dlc/brands/#{URI.encode_uri_component(params[:id].to_s)}/registrar-statuses",
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

        # Starts the registry's brand authentication for a brand whose `brandType` is `TENDLC_PUBLIC_COMPANY`. The
        # registry sends a two-factor verification request to the brand's `businessContactEmail`, and the brand shows
        # `registrationStatus` `PENDING_2FA` until the contact completes it. The request has no body and returns `202`
        # with `{"status":"requested"}`. Any other brand type returns `400` with `invalid request: brand authentication
        # is only available for TENDLC_PUBLIC_COMPANY brands`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::BrandAuthRequested]
        def brand_auth_verification(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/brands/#{URI.encode_uri_component(params[:id].to_s)}/brand-auth-verification",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::BrandAuthRequested.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Asks the registry to send the brand-authentication verification again to the brand's `businessContactEmail`.
        # Use it when a `TENDLC_PUBLIC_COMPANY` brand is `PENDING_2FA` and the contact did not receive or let the first
        # request expire. The request has no body and returns `202` with `{"status":"requested"}`. Any other brand type
        # returns `400`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::BrandAuthRequested]
        def resend2fa(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/brands/#{URI.encode_uri_component(params[:id].to_s)}/resend-2fa",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::BrandAuthRequested.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Requests an external vet of a registered brand from the US 10DLC registry. A successful vet can raise the
        # brand's trust tier and, with it, the throughput carriers grant its campaigns. `type` defaults to `STANDARD`;
        # any value other than `STANDARD`, `ENHANCED` or `POLITICAL` returns `400`. Every call files a new vetting
        # request, so send it only when you intend to. The response is the registry's vetting record, returned as
        # received; list past vets with `GET /10dlc/brands/{id}/vets`.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Brands::Types::BrandVetRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Hash[String, Object]]
        def vet_brand(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request_data = Vobiz::Sms::Brands::Types::BrandVetRequest.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/brands/#{URI.encode_uri_component(params[:id].to_s)}/vet",
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
            Vobiz::Sms::Types::RegistryRecord.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns the brand's vetting records from the US 10DLC registry, one page at a time. The body is `{"results":
        # [...], "paging": {...}}`, where each result is a registry vetting record passed through as received. `page`
        # must be 0 or more and `size` between 0 and 100; other values return `400` with `page must be >= 0 and size
        # between 0 and 100`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [Integer, nil] :page
        # @option params [Integer, nil] :size
        #
        # @return [Vobiz::Sms::Types::BrandVetList]
        def list_brand_vets(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["page"] = params[:page] if params.key?(:page)
          query_params["size"] = params[:size] if params.key?(:size)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/10dlc/brands/#{URI.encode_uri_component(params[:id].to_s)}/vets",
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
            Vobiz::Sms::Types::BrandVetList.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
