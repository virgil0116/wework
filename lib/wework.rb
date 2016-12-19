require 'redis'
require 'active_support/all'
#require 'active_support/core_ext/object/blank'

Dir["#{File.dirname(__FILE__)}/wework/*.rb"].each do |path|
  require path
end

require 'wework/agent/base'
require 'wework/agent/app'
require 'wework/agent/contract'

module Wework
  API_ENDPOINT        = 'https://qyapi.weixin.qq.com/cgi-bin/'.freeze
  ACCESS_TOKEN_PREFIX = 'WEWORK'.freeze
  CONTRACT_APP_ID     = 'CONTRACT'.freeze
  HTTP_OK_STATUS      = [200, 201].freeze

  # Exceptions
  class RedisNotConfigException < RuntimeError; end
  class AccessTokenExpiredError < RuntimeError; end
  class ResponseError < StandardError
    attr_reader :error_code
    def initialize(errcode, errmsg='')
      @error_code = errcode
      super "(#{error_code}) #{errmsg}"
    end
  end
end
