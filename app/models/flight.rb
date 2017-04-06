class Flight < ApplicationRecord
	belongs_to :from_airport, class_name: "Airport", foreign_key: "start_id"
	belongs_to :to_airport,		class_name: "Airport", foreign_key: "finish_id"
	has_many :bookings

	def self.select_flights(args)
		Flight.where(start_id: args[:from_airport], finish_id: args[:to_airport], start_datetime: args[:date].to_date.beginning_of_day..args[:date].to_date.end_of_day)
	end

	def format_flight
		"#{self.from_airport.code}->#{self.to_airport.code}"
	end

end
