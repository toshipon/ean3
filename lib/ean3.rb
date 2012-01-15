# Ean

require 'faraday'
require 'faraday_middleware'

directory = File.expand_path(File.dirname(__FILE__))

module Ean3
  class << self

  end

  require 'ean3/hotels'
  require 'ean3/client'
  #require 'ean3/car_rentals'
  #require 'ean3/air'
end
