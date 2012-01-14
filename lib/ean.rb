# Ean

require 'faraday'
require 'fareday_middleware'

directory = File.expand_path(File.dirname(__FILE__))

module Ean
  class << self

  end

  require 'ean/hotels'
  require 'ean/client'
  #require 'ean/car_rentals'
  #require 'ean/air'
end
