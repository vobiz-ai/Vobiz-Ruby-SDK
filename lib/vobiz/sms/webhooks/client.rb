# frozen_string_literal: true

module Vobiz
  module Sms
    module Webhooks
      class Client
        # @param client [Vobiz::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns all of your webhook subscriptions, newest first, as a bare JSON array. The body is `null` rather than
        # `[]` when you have none, so treat `null` as an empty list. The response includes each subscription's `secret`,
        # so keep it out of logs and client-side code.
        #
        # @param request_options [Hash]
        # @param _params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Array[Vobiz::Sms::Types::WebhookSubscription], nil]
        def list_webhooks(request_options: {}, **_params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/webhooks",
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

        # Registers an HTTPS endpoint that receives the events you subscribe to as signed `POST` requests. Only `url` is
        # required; omit `events` to subscribe to `message.received`, `message.delivered` and `message.failed`. Every
        # delivery carries `X-Webhook-ID`, `X-Webhook-Event` and `X-Webhook-Signature`, a lower-case hex HMAC-SHA256 of
        # the raw body keyed with your `secret`. The subscription is active as soon as it is created; see the Webhooks
        # guide for the payload envelope and a verification example.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Webhooks::Types::CreateWebhookRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::WebhookSubscription]
        def create_webhook(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/webhooks",
            body: Vobiz::Sms::Webhooks::Types::CreateWebhookRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::WebhookSubscription.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns one webhook subscription with its URL, events, `active` flag and signing secret. Use it to confirm the
        # result of an update, since `PUT /webhooks/{id}` returns only `{"status":"ok"}`.
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
        # @return [Vobiz::Sms::Types::WebhookSubscription]
        def get_webhook(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/webhooks/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::WebhookSubscription.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Changes any subset of `url`, `secret`, `events` and `active`. Fields you omit keep their current value; a
        # field you send, including an empty string, replaces it. Set `active` to `false` to pause deliveries without
        # losing the subscription, and back to `true` to resume. The response is `{"status":"ok"}`, so call `GET
        # /webhooks/{id}` to read the updated subscription.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Webhooks::Types::UpdateWebhookRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::StatusOk]
        def update_webhook(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request_data = Vobiz::Sms::Webhooks::Types::UpdateWebhookRequest.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "api/v1/sms/webhooks/#{URI.encode_uri_component(params[:id].to_s)}",
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
            Vobiz::Sms::Types::StatusOk.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Removes the subscription and stops all deliveries to its URL. The response is `200` with `{"status":"ok"}`. To
        # stop deliveries temporarily and keep the configuration, set `active` to `false` with `PUT /webhooks/{id}`
        # instead.
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
        # @return [Vobiz::Sms::Types::StatusOk]
        def delete_webhook(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "api/v1/sms/webhooks/#{URI.encode_uri_component(params[:id].to_s)}",
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
      end
    end
  end
end
