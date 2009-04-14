#urbanmapping rest api

require 'rubygems'
require 'httparty'

class UrbanMapping
  include HTTParty
  format :json
  
  URBAN_MAPPING_API = {
    'getNeighborhoodsByLatLng' => [:lat, :lng],
    'getNearestNeighborhood'   => [:lat, :lng],
    'getNeighborhoodsByExtent' => [:swlat, :swlng, :nelat, :nelng],
    'getNeighborhoodsByAddress'=> [:street, :city, :state, :country],
    'getNeighborhoodsByCityStateCountry' => [:city, :state, :country],
    'getNeighborhoodsByPostalCode' => [:postalcode],
    'getNeighborhoodsByName' => [:name],
    'getNeighborhoodDetail' => [:neighborhoodId],
    'getNeighborhoodRelationships' => [:neighborhoodId]
  }
  
  def initialize(apikey)
    @apikey = apikey
  end

  def query(options={})
    check_requirements(options)
    
  	method = options.delete(:method)
  	options.merge!({:apikey => @apikey})
    UrbanMapping.get("http://api0.urbanmapping.com/neighborhoods/rest/" + method, :query => options)
  end
  
  def check_requirements(options)
	  raise( 'apikey required for urbanmapping' ) if @apikey.nil?
    raise( 'method required for urbanmapping' ) if options[:method].nil?
    raise( "method #{options[:method]} urbanmapping" ) unless URBAN_MAPPING_API.has_key?( options[:method] )
    missing_params = []
    URBAN_MAPPING_API[options[:method]].each {|param| missing_params<<param unless options.has_key?(param) }
    raise( "#{options[:method]} requires #{missing_params.join(", ")} parameters" ) unless missing_params.empty?
  end
end

