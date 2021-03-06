module Wework
  class Engine

    attr_reader :corp_id, :corp_secret, :app_id, :app_secret

    def initialize(options={})
      @corp_id = options[:corp_id]
      @corp_secret = options[:corp_secret]
      @app_id = options[:app_id]
      @app_secret = options[:app_secret]
    end

    def contact
      @contact ||= Wework::Api::Contact.new(corp_id, corp_secret) if contact?
    end

    def agent
      @agent ||= Wework::Api::Agent.new(corp_id, app_id, app_secret) if agent?
    end

    private

    def agent?
      corp_id.present? && app_id.present? && app_secret.present?
    end

    def contact?
      corp_id.present? && corp_secret.present?
    end
  end
end