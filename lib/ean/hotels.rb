module Ean
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

    def getGeoLocation
      response = connection.get("geoSearch")
      return_error_or_body(response, response.body.response)
    end

    def getInformation
      response = conncetion.get("info")
      return_error_or_body(response, response.body.response)
    end

    def getAvaliabillity
    end

    def getRules
    end

    def getPaymentInfo
    end

    def getReservation
    end

    def getAlternateProperties
    end

    def getItinerary
    end

    def getCancel
    end

    def getPing
    end
  end

end
