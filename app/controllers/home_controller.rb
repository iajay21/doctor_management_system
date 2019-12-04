class HomeController < ApplicationController
	def index
		@user = current_user
		if @user.role == "doctor"
			@doctor_appointments = Appointment.where(doctor_id: @user.id, is_accepted: false)
			@accepted_appointments = Appointment.where(doctor_id: @user.id, is_accepted: true)
		elsif @user.role == "patient"
			@doctors = User.where(role: "doctor")
			@booked_appointments = Appointment.where(patient_id: @user.id)
		end
	end
end
