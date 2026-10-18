# frozen_string_literal: true

module Vobiz
  module Sms
    module RcsSenders
      class Client
        # @param client [Vobiz::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns the RCS senders on your account as a bare JSON array, without a total count. Page through them with
        # `limit` and `offset`; an empty array means you have reached the end. `status` here is the last stored value,
        # so call `GET /senders/{id}/status` for the latest state.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer, nil] :limit
        # @option params [Integer, nil] :offset
        #
        # @return [Array[Vobiz::Sms::Types::Sender]]
        def list_senders(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["offset"] = params[:offset] if params.key?(:offset)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/senders",
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

        # Registers a new RCS sender (agent) with the RCS platform and stores it on your account with status `pending`.
        # `provider` and `senderName` are required; the profile fields are reviewed by the RCS platform and the carriers
        # before the sender can reach real users. Poll `GET /senders/{id}/status` until the platform reports it as
        # launched, then send with its `senderName` as `from` and `channel: rcs` on `POST /messages`. A rejected request
        # returns `400` with the platform's reason in `error`.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::RcsSenders::Types::CreateSenderRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::Sender]
        def create_sender(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/senders",
            body: Vobiz::Sms::RcsSenders::Types::CreateSenderRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Sender.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns one RCS sender as stored on your account, including its full profile. `status` is the last value
        # stored on your account; call `GET /senders/{id}/status` to refresh it from the RCS platform. An unknown id
        # returns `404`.
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
        # @return [Vobiz::Sms::Types::Sender]
        def get_sender(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/senders/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Sender.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Updates the sender's profile on the RCS platform and then on your account, and returns the updated sender.
        # Send only the fields you want to change; fields you leave out keep their value. `provider`, `senderName` and
        # `hostingRegion` are fixed after creation. Every failure, including an unknown id, returns `400`.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::RcsSenders::Types::UpdateSenderRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Sender]
        def update_sender(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request_data = Vobiz::Sms::RcsSenders::Types::UpdateSenderRequest.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "api/v1/sms/senders/#{URI.encode_uri_component(params[:id].to_s)}",
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
            Vobiz::Sms::Types::Sender.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Asks the RCS platform for the sender's current launch status, stores it on the sender and returns the full
        # sender. Poll it after `POST /senders` or a profile update until `status` shows the sender is live, then start
        # sending. Every failure, including an unknown id, returns `400`.
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
        # @return [Vobiz::Sms::Types::Sender]
        def get_sender_status(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/senders/#{URI.encode_uri_component(params[:id].to_s)}/status",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Sender.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns the templates registered on one RCS sender as a bare JSON array, without a total count. Page through
        # them with `limit` and `offset`. `status` is the last stored value; refresh one template with its `/status`
        # endpoint.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :sender_id
        # @option params [Integer, nil] :limit
        # @option params [Integer, nil] :offset
        #
        # @return [Array[Vobiz::Sms::Types::Template]]
        def list_templates(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["offset"] = params[:offset] if params.key?(:offset)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/senders/#{URI.encode_uri_component(params[:sender_id].to_s)}/templates",
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

        # Registers a message template on an RCS sender with the RCS platform and returns it with status `pending`.
        # `templateName`, `type` and `content` are passed to the platform unchanged, so use the template types and
        # content shapes the RCS platform defines. Call `GET /senders/{senderId}/templates/{templateName}/status` to
        # follow approval. An unknown sender or a platform rejection returns `400`.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::RcsSenders::Types::CreateTemplateRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :sender_id
        #
        # @return [Vobiz::Sms::Types::Template]
        def create_template(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request_data = Vobiz::Sms::RcsSenders::Types::CreateTemplateRequest.new(params).to_h
          non_body_param_names = %w[senderId]
          body = request_data.except(*non_body_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/senders/#{URI.encode_uri_component(params[:sender_id].to_s)}/templates",
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
            Vobiz::Sms::Types::Template.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns one template as stored on your account, including the `content` you submitted. For the latest approval
        # state from the RCS platform, call `GET /senders/{senderId}/templates/{templateName}/status`. An unknown sender
        # or template returns `404`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :sender_id
        # @option params [String] :template_name
        #
        # @return [Vobiz::Sms::Types::Template]
        def get_template(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/senders/#{URI.encode_uri_component(params[:sender_id].to_s)}/templates/#{URI.encode_uri_component(params[:template_name].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Template.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Removes the template from the RCS platform and from your account, and returns `204` with no body. You cannot
        # send with the template afterwards. An unknown sender or template returns `400`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :sender_id
        # @option params [String] :template_name
        #
        # @return [untyped]
        def delete_template(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "api/v1/sms/senders/#{URI.encode_uri_component(params[:sender_id].to_s)}/templates/#{URI.encode_uri_component(params[:template_name].to_s)}",
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

        # Asks the RCS platform for the template's current approval status, stores it on the template and returns the
        # full template. Poll it after `POST /senders/{senderId}/templates` until the template is approved. Every
        # failure, including an unknown sender or template, returns `400`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :sender_id
        # @option params [String] :template_name
        #
        # @return [Vobiz::Sms::Types::Template]
        def get_template_status(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/senders/#{URI.encode_uri_component(params[:sender_id].to_s)}/templates/#{URI.encode_uri_component(params[:template_name].to_s)}/status",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Template.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
