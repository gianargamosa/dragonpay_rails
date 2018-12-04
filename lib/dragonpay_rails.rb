require "dragonpay_rails/configuration"
require "dragonpay_rails/merchant"
require "dragonpay_rails/version"

module DragonpayRails
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end