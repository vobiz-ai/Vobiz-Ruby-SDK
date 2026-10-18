# frozen_string_literal: true

module Vobiz
  module Sms
    module RcsSenders
      module Types
        class CreateSenderRequest < Internal::Types::Model
          field :provider, -> { String }, optional: false, nullable: false

          field :sender_name, -> { String }, optional: false, nullable: false, api_name: "senderName"

          field :display_name, -> { String }, optional: true, nullable: false, api_name: "displayName"

          field :description, -> { String }, optional: true, nullable: false

          field :billing_category, -> { String }, optional: true, nullable: false, api_name: "billingCategory"

          field :use_case, -> { String }, optional: true, nullable: false, api_name: "useCase"

          field :hosting_region, -> { String }, optional: true, nullable: false, api_name: "hostingRegion"

          field :brand, -> { Vobiz::Sms::Types::SenderBrand }, optional: true, nullable: false

          field :color, -> { String }, optional: true, nullable: false

          field :phones, -> { Internal::Types::Array[Vobiz::Sms::Types::SenderPhone] }, optional: true, nullable: false

          field :emails, -> { Internal::Types::Array[Vobiz::Sms::Types::SenderEmail] }, optional: true, nullable: false

          field :websites, -> { Internal::Types::Array[Vobiz::Sms::Types::SenderWebsite] }, optional: true, nullable: false

          field :banner_url, -> { String }, optional: true, nullable: false, api_name: "bannerUrl"

          field :logo_url, -> { String }, optional: true, nullable: false, api_name: "logoUrl"

          field :privacy, -> { Vobiz::Sms::Types::SenderLink }, optional: true, nullable: false

          field :terms_of_service, -> { Vobiz::Sms::Types::SenderLink }, optional: true, nullable: false, api_name: "termsOfService"

          field :platform, -> { Vobiz::Sms::Types::SenderPlatform }, optional: true, nullable: false
        end
      end
    end
  end
end
