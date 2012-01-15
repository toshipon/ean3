module Ean3
  class Client
    extend Forwardable

    include Hotels

    attr_reader :cid, :apikey, :secret

    def initialize options={}
      @cid = options[:cid].nil? ? default_cid : options[:cid]
      @apikey = options[:apikey]
      @secret = options[:secret]
      @minorRev = options[:minorRev]
      @locale = options[:locale]
      @currencyCode = options[:currencyCode]
      @customerSessionId = options[:customerSessionId]
      @customerIpAddress = options[:customerIpAddress]
      @customerUserAgent = options[:customerUserAgent]
      @debug = options[:debug]
      #@sig =
      @ssl = options[:ssl]
    end

    def api_version
      'v3'
    end

    def api_url
      version = api_version()
      if @ssl
        "https://book.api.ean.com/ean-services/rs/hotel/#{version}/"
      else
        "http://api.ean.com/ean-services/rs/hotel/#{version}/"
      end
    end

    def default_cid
      '55505'
    end

    def ssl
      @ssl
    end

    def sig
      # apikey + secret + timestamp -> md5 key
      ''
    end

    def connection
      params = {}
      params[:cid] = @cid
      params[:apikey] = @apikey
      params[:secret] = @secret
      params[:minorRev] = @minorRev
      params[:locale] = @locale
      params[:currencyCode] = @currencyCode
      params[:customerSessionId] = @customerSessionId
      params[:customerIpAddress] = @customerIpAddress
      params[:customerUserAgent] = @customerUserAgent
      @connection ||= Faraday::Connection.new(:url => api_url, :ssl => @ssl, :sig => sig, :params => params, :headers => default_headers) do |builder|
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded

        if @debug
          builder.use Faraday::Response::Logger
        end

        builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson

        builder.adapter Faraday.default_adapter

        builder.request :multipart
        builder.request :url_encoded
        builder.request :json
      end
    end

    def return_error_or_body(response, response_body)
      if response.success?
          response_body
      else
          raise Ean::APIError.new(response.headers, response.body)
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
