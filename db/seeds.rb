# Airports
airports = ["SFO", "NYC", "LAX", "IAH", "TPA", "RDU", "GSO", "MCO", "CLT"]
airports.each do |code|
	Airport.create!(code: "#{code}")
end

# Flights
airports = Airport.all
airports[1..-1].each do |airport|
	Flight.create!(start_id: Airport.first.id,
							 	 finish_id: airport.id,
							 	 start_datetime: Time.zone.now,
							 	 flight_duration: 3600)
end