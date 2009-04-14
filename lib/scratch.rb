http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=3030+16th+street+san+francisco,+ca&sll=-34.894119,-56.067451&sspn=0.610503,1.172791&ie=UTF8&ll=37.765185,-122.420354&spn=0.009194,0.018325&z=16&iwloc=A

@um['getNeighborhoodsByLatLng'].get :Lat=>'37.765185', :Lon=>'-122.420354', :apikey=>'8uaxxg6j74c3299wr7e3gbev'

37.765185,-122.420354



@apikey = 'xyz'

options = { :method => 'getNeighborhoodsByLatLng', :lat=>'37.765185', :lng=>'-122.420354', :apikey=>'8uaxxg6j74c3299wr7e3gbev' }


def get(options=>{})
	raise( StandardError('method required for urbanmapping') ) if options[:method].nil?
	raise( StandardError('apikey required for urbanmapping') ) if @apikey.nil?
	
	method = options.delete(:method)
	#need to do url encoding
	options_array = options.map {|key,value| "#{key}=#{value}"}
	params = options_array.join('&')
	
	response = Net::HTTP.get URI.parse( "http://api0.urbanmapping.com/neighborhoods/rest/" + method + "?" + params)

end



irb(main):009:0>  a =   Net::HTTP.get URI.parse('http://api0.urbanmapping.com/neighborhoods/rest/getNeighborhoodsByLatLng?lat=37.76&lng=-122.46&apikey=8uaxxg6j74c3299wr7e3gbev&format=json')
=> "<h1>403 Developer Inactive</h1>"
