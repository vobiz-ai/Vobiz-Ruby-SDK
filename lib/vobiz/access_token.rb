require 'base64'
require 'json'
require 'openssl'

module Vobiz
  class AccessToken
    attr_reader :auth_id, :username, :uid

    def initialize(auth_id = ENV['VOBIZ_AUTH_ID'], auth_token = ENV['VOBIZ_AUTH_TOKEN'], username = nil, validity_options = {}, uid = nil)
      raise ArgumentError, 'Please provide authId' if auth_id.to_s.empty?
      raise ArgumentError, 'Please provide authToken' if auth_token.to_s.empty?
      raise ArgumentError, 'Please provide username' if username.to_s.empty?

      @auth_id = auth_id
      @key = auth_token
      @username = username

      valid_from = validity_options[:valid_from] || validity_options[:validFrom]
      valid_till = validity_options[:valid_till] || validity_options[:validTill]
      lifetime = validity_options[:lifetime]

      if valid_from
        raise ArgumentError, 'Please define at maximum any two of validFrom, lifetime and validTill' if lifetime && valid_till
        @valid_from = valid_from.to_f
        @lifetime = valid_till ? (valid_till.to_f - @valid_from) : (lifetime || 86_400).to_f
      else
        @lifetime = (lifetime || 86_400).to_f
        @valid_from = valid_till ? (valid_till.to_f - @lifetime) : Time.now.to_f
      end

      @uid = uid || "#{username}-#{(Time.now.to_f * 1000).to_i}"
      @grants = {}
    end

    def add_voice_grants(incoming = false, outgoing = false)
      @grants = {
        voice: {
          incoming_allow: incoming,
          outgoing_allow: outgoing
        }
      }
      self
    end

    def to_jwt
      header = {
        typ: 'JWT',
        cty: 'vobiz;v=1',
        alg: 'HS256'
      }

      payload = {
        jti: @uid,
        iss: @auth_id,
        sub: @username,
        nbf: @valid_from.floor,
        exp: (@valid_from + @lifetime).floor,
        grants: @grants
      }

      encoded_header = base64url(JSON.generate(header))
      encoded_payload = base64url(JSON.generate(payload))
      signing_input = "#{encoded_header}.#{encoded_payload}"
      signature = OpenSSL::HMAC.digest('sha256', @key, signing_input)
      "#{signing_input}.#{base64url(signature)}"
    end

    private

    def base64url(data)
      Base64.strict_encode64(data).tr('+/', '-_').delete('=')
    end
  end
end
