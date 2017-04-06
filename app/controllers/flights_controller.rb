class FlightsController < ApplicationController

	def index
		@airports = Airport.all.map{ |a| [ a.code, a.id ] }
		@passengers = (1..4).map{ |p| [ p, p ] }
		tmp = []
		Flight.all.each do |flight| 
			date = flight.start_datetime.to_date
			tmp << date if !tmp.include?(date)
		end
		@dates = tmp.sort!.map{ |d| [ d, d ] }

		if params[:date]
			@flights = Flight.select_flights(params)
		end
	end
end
