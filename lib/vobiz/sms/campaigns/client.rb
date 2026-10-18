# frozen_string_literal: true

module Vobiz
  module Sms
    module Campaigns
      class Client
        # @param client [Vobiz::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns every 10DLC and toll-free campaign on your account as a bare JSON array, newest first. The list is not
        # paginated and reads the records stored on your account without contacting the registry. Toll-free campaigns
        # have `campaignType` `TOLL_FREE_UNIFIED_NUMBER` and no `brandId`. Call `GET /10dlc/campaigns/{id}` for the
        # latest registry state of one campaign.
        #
        # @param request_options [Hash]
        # @param _params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Array[Vobiz::Sms::Types::Campaign]]
        def list_campaigns(request_options: {}, **_params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/10dlc/campaigns",
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

        # Creates a 10DLC campaign, the messaging program you run under one of your brands, and mirrors it to the US
        # 10DLC registry in `DRAFT` stage. `name` and `brandId` are required; `campaignType` defaults to
        # `TEN_DIGIT_LONG_CODE`. Upload any `supportingDocuments` or `mmsSampleFiles` with `POST /10dlc/documents`
        # first. Pass a `referenceId` so a retried request reconciles to the same campaign. Next, submit the campaign
        # with `POST /10dlc/campaigns/{id}/register`; toll-free verification uses `POST /10dlc/campaigns/toll-free`
        # instead.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Campaigns::Types::CreateCampaignRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::Campaign]
        def create_campaign(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/campaigns",
            body: Vobiz::Sms::Campaigns::Types::CreateCampaignRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Campaign.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Starts toll-free verification for one or more toll-free numbers. The business details travel inside the
        # request, so no brand is needed; only `name` is required, but the registry reviews every field you send. The
        # campaign is created with `campaignType` `TOLL_FREE_UNIFIED_NUMBER` and no `brandId`. Pass a `referenceId` so a
        # retried request reconciles to the same campaign, then submit it with `POST /10dlc/campaigns/{id}/register`.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Campaigns::Types::TollFreeCampaignRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::Campaign]
        def create_toll_free_campaign(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/campaigns/toll-free",
            body: Vobiz::Sms::Campaigns::Types::TollFreeCampaignRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Campaign.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns the priority options available to your account at the US 10DLC registry, as a JSON array. Pass an
        # option's `id` as `priorityId` when you create or register a toll-free campaign. An empty array means no
        # priority options apply to your account, and you can omit `priorityId`.
        #
        # @param request_options [Hash]
        # @param _params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Array[Vobiz::Sms::Types::PriorityOption]]
        def campaign_priorities(request_options: {}, **_params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/10dlc/campaigns/priorities",
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

        # Returns one campaign after refreshing its `stage` and review feedback (`rejectionReasons`) from the US 10DLC
        # registry. If the registry is slow to answer, you get the stored record and `lastSyncedAt` tells you how fresh
        # it is. Poll this endpoint (or listen for the `10dlc.campaign.updated` WebSocket event) after registering until
        # `stage` settles at `REGISTERED` or `REJECTED`.
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
        # @return [Vobiz::Sms::Types::Campaign]
        def get_campaign(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/10dlc/campaigns/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Campaign.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Replaces the editable fields of a 10DLC campaign and pushes the change to the US 10DLC registry. This is a
        # full replacement: `name` is required and any field you leave out is cleared. `campaignType` and the brand stay
        # as created, and `referenceId` is ignored. The registry accepts updates while the campaign is `DRAFT` or
        # `REJECTED`. Toll-free campaigns return `400` on this endpoint.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Campaigns::Types::UpdateCampaignRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Campaign]
        def update_campaign(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request_data = Vobiz::Sms::Campaigns::Types::UpdateCampaignRequest.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "api/v1/sms/10dlc/campaigns/#{URI.encode_uri_component(params[:id].to_s)}",
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
            Vobiz::Sms::Types::Campaign.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes the campaign from your account and from the US 10DLC registry and returns `204` with no body. The
        # registry accepts deletion while the campaign is `DRAFT`, `DEREGISTERED` or `REJECTED`; deregister a registered
        # campaign with `POST /10dlc/campaigns/{id}/deregister` first. Delete all of a brand's campaigns before you
        # delete the brand.
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
        def delete_campaign(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "api/v1/sms/10dlc/campaigns/#{URI.encode_uri_component(params[:id].to_s)}",
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

        # Submits the campaign to the US 10DLC registry for review and returns the refreshed campaign. The `stage` moves
        # out of `DRAFT`; poll `GET /10dlc/campaigns/{id}` until it settles at `REGISTERED` or `REJECTED`. The body is
        # optional and carries a `priorityId` from `GET /10dlc/campaigns/priorities` for toll-free campaigns; a value
        # that is not a UUID returns `400`. Submit only when the campaign details are final and you intend to run this
        # program.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Campaigns::Types::CampaignRegisterRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Campaign]
        def register_campaign(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request_data = Vobiz::Sms::Campaigns::Types::CampaignRegisterRequest.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/campaigns/#{URI.encode_uri_component(params[:id].to_s)}/register",
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
            Vobiz::Sms::Types::Campaign.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Withdraws a registered campaign from the US 10DLC registry and returns the campaign. Once deregistration
        # completes, traffic on the campaign's numbers is no longer covered by this registration, so move the numbers to
        # another registered campaign first if you keep sending. The request has no body. A deregistered campaign can
        # then be deleted with `DELETE /10dlc/campaigns/{id}`.
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
        # @return [Vobiz::Sms::Types::Campaign]
        def deregister_campaign(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/campaigns/#{URI.encode_uri_component(params[:id].to_s)}/deregister",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Campaign.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Asks the US 10DLC registry to reconsider a `REJECTED` campaign and returns the campaign after the appeal is
        # filed. Fix the campaign with `PUT /10dlc/campaigns/{id}` first, then explain what changed in `reason`, which
        # is required (`400` with `invalid request: reason is required` otherwise). Follow the outcome with `GET
        # /10dlc/campaigns/{id}`.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Campaigns::Types::CampaignAppealRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Campaign]
        def appeal_campaign(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request_data = Vobiz::Sms::Campaigns::Types::CampaignAppealRequest.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/campaigns/#{URI.encode_uri_component(params[:id].to_s)}/appeal",
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
            Vobiz::Sms::Types::Campaign.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Asks the US 10DLC registry to update the set of numbers covered by a registered campaign, without
        # deregistering it. Provide `numbers`, `numberKeys`, or both; if both are empty the call returns `400` with
        # `invalid request: numbers or numberKeys is required`. The response is the campaign; the `numbers` list stored
        # on your account is left as it was. Use `POST` and `DELETE /10dlc/campaigns/{id}/numbers` for incremental
        # changes.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Types::CampaignNumbersRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Campaign]
        def update_campaign_registration(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[id]
          body_params = params.except(*path_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/campaigns/#{URI.encode_uri_component(params[:id].to_s)}/update-registration",
            body: Vobiz::Sms::Types::CampaignNumbersRequest.new(body_params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Campaign.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns the campaign's status at each US carrier network, read live from the US 10DLC registry. Each entry
        # names the network and its `state`, plus the message class, throughput and brand tier when the network reports
        # them. Use it after the campaign reaches `REGISTERED` to see which networks have provisioned it and what
        # throughput they grant.
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
        # @return [Array[Vobiz::Sms::Types::CampaignNetworkStatus]]
        def campaign_network_statuses(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/10dlc/campaigns/#{URI.encode_uri_component(params[:id].to_s)}/network-statuses",
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

        # Returns the numbers attached to the campaign at the US 10DLC registry, as `{"numberPreviews": [...]}`. Each
        # entry gives the number, its country and the registry `numberKey`, which you can pass in `numberKeys` on the
        # number endpoints. Use it to confirm which numbers the registry associates with the campaign.
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
        # @return [Vobiz::Sms::Types::CampaignNumberList]
        def list_campaign_numbers(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/10dlc/campaigns/#{URI.encode_uri_component(params[:id].to_s)}/numbers",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::CampaignNumberList.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Attaches numbers to the campaign at the US 10DLC registry and adds the `numbers` values to the campaign's
        # `numbers` list on your account. Provide `numbers`, `numberKeys`, or both; if both are empty the call returns
        # `400`. Returns `200` with `{"status":"ok"}`. Attach only numbers on your account that you send this program
        # from.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Types::CampaignNumbersRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::StatusOk]
        def add_campaign_numbers(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[id]
          body_params = params.except(*path_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/campaigns/#{URI.encode_uri_component(params[:id].to_s)}/numbers",
            body: Vobiz::Sms::Types::CampaignNumbersRequest.new(body_params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::StatusOk.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Detaches numbers from the campaign at the US 10DLC registry and removes the `numbers` values from the
        # campaign's `numbers` list on your account. Send `numbers`, `numberKeys`, or both in the `DELETE` request body;
        # if both are empty the call returns `400`. Returns `200` with `{"status":"ok"}`. Messages from a detached
        # number are no longer covered by this campaign.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Types::CampaignNumbersRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::StatusOk]
        def remove_campaign_numbers(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[id]
          body_params = params.except(*path_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "api/v1/sms/10dlc/campaigns/#{URI.encode_uri_component(params[:id].to_s)}/numbers",
            body: Vobiz::Sms::Types::CampaignNumbersRequest.new(body_params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::StatusOk.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Uploads a supporting document or MMS sample file for campaign registration and stores it at the US 10DLC
        # registry. Send `multipart/form-data` with the file in a part named `document` that carries a filename; the
        # file can be up to 10 MB (`413` above that). The response is the document record; reference its `documentId` in
        # a campaign's `supportingDocuments` or `mmsSampleFiles`, and use the same value to download it again.
        #
        # @param request_options [Hash]
        # @param params [void]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::Document]
        def upload_document(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          body = Internal::Multipart::FormData.new

          body.add_part(params[:document].to_form_data_part(name: "document")) if params[:document]

          request = Vobiz::Internal::Multipart::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/10dlc/documents",
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
            Vobiz::Sms::Types::Document.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Downloads a document you uploaded with `POST /10dlc/documents`. The response body is the file itself, with the
        # file's own `Content-Type` and a `Content-Disposition: attachment` header that carries the original filename.
        # Look the file up by its `documentId`, not by the record `id`.
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
        def get_document(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/10dlc/documents/#{URI.encode_uri_component(params[:id].to_s)}",
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
end
