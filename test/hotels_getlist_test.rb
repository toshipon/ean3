require 'test_helper'

class TestHotelGetList < ActiveSupport::TestCase

  setup do
    @client = ean_test_client
  end

  test "hoge" do
    stub_get("http://api.ean.com/ean-service/rs/hotel/v3/list", "hotel_getlist.json")
    options = {
     :arrivalDate => "01/10/2012"
    };
    hotels = @client.getList(options);
  end
end
