class PassengerMailer < ApplicationMailer
	default from: 'notifications@odin-flight-booker.com'

	def thank_you_email(passenger)
		@passenger = passenger
		mail(to: @passenger.email, subject: "Thank you for booking!")
	end
end
