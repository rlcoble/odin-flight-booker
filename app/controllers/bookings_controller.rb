class BookingsController < ApplicationController

	def new
		@booking = Booking.new
		@flight = Flight.find(params[:flight][:flight_id])
		@passengers = Array.new(params[:passengers].to_i) { @booking.passengers.build }
	end

	def create
		@booking = Booking.new(booking_params)
		if @booking.save
			@booking.passengers.each do |passenger|
				PassengerMailer.thank_you_email(passenger).deliver_now
			end
			redirect_to @booking
		else
			render 'new'
		end
	end

	def show
		@booking = Booking.find(params[:id])
	end

	private
		def booking_params
			params.require(:booking).permit(:flight_id, :passengers_attributes => [:name, :email])
		end		
end
