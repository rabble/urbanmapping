#urbanmapping rest api

require 'net-http'
require 'uri'
require 'JSON'

@apikey = 'xyz'

options = { :method => 'getNeighborhoodsByLatLng', :lat=>'37.765185', :lng=>'-122.420354', :apikey=>'8uaxxg6j74c3299wr7e3gbev' }


def get(options=>{})
  #need to move these to use UrbanMapping::Exception
	raise( StandardError('method required for urbanmapping') ) if options[:method].nil?
	raise( StandardError('apikey required for urbanmapping') ) if @apikey.nil?
	
	method = options.delete(:method)
	#need to do url encoding
	options_array = options.map {|key,value| "#{key}=#{value}"}
	params = options_array.join('&')
	
	response = Net::HTTP.get URI.parse( "http://api0.urbanmapping.com/neighborhoods/rest/" + method + "?" + params)

end
