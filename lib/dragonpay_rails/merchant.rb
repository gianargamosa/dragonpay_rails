require 'securerandom'
module DragonpayRails
  class Merchant
    attr_accessor :merchant_id, :txn_id, :amount, :ccy, :description, :email, :digest
    if Rails.env.development?
      URL = 'https://test.dragonpay.ph/Pay.aspx'
    else
      URL = 'https://gw.dragonpay.ph/Pay.aspx'
    end
    def initialize(options = {})
      @amount = options[:amount]
      @ccy = options[:ccy]
      @description = options[:description]
      @email = options[:email]
    end

    def pay
      generate_url
    end

    private

    def generate_url
      merchant_id = DragonpayRails.configuration.merchant_id
      secret_key = DragonpayRails.configuration.secret_key
      txn_id = SecureRandom.urlsafe_base64 12
      details = [ merchant_id, txn_id, amount, ccy, description, email, secret_key]
      digest = Digest::SHA1.hexdigest details.join(':')

      parameters = {
        merchantid: merchant_id,
        txnid: txn_id,
        amount: amount,
        ccy: ccy,
        description: description,
        email: email,
        digest: digest,
        mode: 7
      }

      query_string = parameters.to_a.map { |x| "#{x[0]}=#{x[1]}" }.join("&")
      url = URL + "?#{query_string}"
    end
  end
end
