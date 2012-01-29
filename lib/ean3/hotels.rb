module Ean3
  module Hotels
    # Request a List of Hotels
    #
    # @param [Hash] options
    #
    # = HotelListRequest Bese Elements  =
    # @option options String :arrivalDate - The desired check-in date
    #                                     - Format MM/DD/YYYY
    #                                     - Example 10/18/2011
    # @option options String :departureDate - The desired check-out date
    # @option options int    :numberOfResults
    #
    # = Location search parameters alternative #1 (use city/stateProvinceCode/countryCode parameters) =
    # @option options String :city
    # @option options String :stateProvinceCode
    # @option options String :countryCode
    #
    def getList(options={})
      response = connection.get do |req|
        req.url "list", options
      end
      return_error_or_body(response, response.body)
    end

    # Location Geo Functions
    #
    #
    def getGeoLocation
      response = connection.get do |req|
        req.url "geoSearch", options
      end
      return_error_or_body(response, response.body)
    end

    # Request Hotel Infomation
    #
    #
    def getInformation
      response = conncetion.get do |req|
        req.url "info", options
      end
      return_error_or_body(response, response.body)
    end

    # Request Hotel Rooms
    #
    #
    def getAvaliabillity
      response = conncetion.get do |req|
        req.url "avail", options
      end
      return_error_or_body(response, response.body)
    end

    # Request Rate Rules
    #
    #
    def getRules
      response = conncetion.get do |req|
        req.url "rules", options
      end
      return_error_or_body(response, response.body)
    end

    # Request Payment Types
    #
    #
    def getPaymentInfo
      response = conncetion.get do |req|
        req.url "paymentInfo", options
      end
      return_error_or_body(response, response.body)
    end

    # Book a Reservation
    #
    #
    def getReservation
      response = conncetion.post do |req|
        req.url "res", options
      end
      return_error_or_body(response, response.body)
   end

    # Request Alternate Properties
    #
    #
    def getAlternateProperties
      response = conncetion.get do |req|
        req.url "altProps", options
      end
      return_error_or_body(response, response.body)
    end

    # Request Itinerary Record
    #
    #
    def getItinerary
      response = conncetion.get do |req|
        req.url "itin", options
      end
      return_error_or_body(response, response.body)
    end

    # Cancel a Reservation
    #
    #
    def getCancel
      response = conncetion.post do |req|
        req.url "cancel", options
      end
      return_error_or_body(response, response.body)
    end

    # Ping Request
    #
    #
    def getPing
      response = conncetion.get do |req|
        req.url "ping", options
      end
      return_error_or_body(response, response.body)
    end
  end

end
