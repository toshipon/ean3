require 'test_helper'

class TestHotelGetList < Test::Unit::TestCase

  context "When using the ean API and working with hotels getList" do
    setup do
      @client = ean_test_client
    end

    should "hoge" do
      stub_get("http://api.ean.com/ean-service/rs/hotel/v3/list", "hotel_getlist.json")
      options = {
        :arrivalDate => "01/10/2012"
      };
      hotels = @client.getList(options);
      #logger.debug hotels
      puts hotels
      puts hotels.HotelListResponse
    end
  end
end
