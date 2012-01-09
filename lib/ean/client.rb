module Ean
  class Client

    attr_reader :cid, :apikey, :secret

    def initialize options={}
      @cid = options[:cid]
      @apikey = options[:apikey]
      @secret = options[:secret]
      @ssl = options[:ssl].nil? ? Hash.new : options[:ssl]
    end

    def api_version
      '3'
    end

    def api_url
      'https://book.api.ean.com/ean-services/rs/hotel/v3'
    end

    def ssl
      @ssl
    end

    def connection
      params = {}
      params[:cid] = @cid
      params[:apikey] = @apikey
      params[:secret] = @secret
      @connection ||= Faraday::Connection.new(:url => api_url, :ssl => @ssl, :params => params, :headers => defauls_headers) do |builder|)
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncode

        builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson

        builder.adapter Faraday.default_adapter
      end
    end

    private
      def default_headers
        headers = {
            :accept => 'application/json',
            :user_agent => 'Ruby gem'
        }
      end
    end
  end
end
