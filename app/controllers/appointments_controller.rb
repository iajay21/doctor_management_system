class AppointmentsController < ApplicationController

	def new
		@appointment = Appointment.new
		@doctors = User.where(role: "doctor")
	end

	def create
		# return render body: params.inspect
		@appointment = Appointment.new(appointment_params)
		if @appointment.save
			flash[:notice] = "You have successfully set appointment with #{@appointment.doctor.name}"
			redirect_to root_path
		else
			redirect_to new_appointment_path
		end
	end

	def edit
		@appointment = Appointment.find(params[:id])
		@doctors = User.where(role: "doctor")
	end

	def update
		@appointment = Appointment.find(params[:id])
		if @appointment.update_attributes(appointment_params)
			flash[:notice] = "You have successfully update appointment with #{@appointment.doctor.name}"
			redirect_to root_path
		else
			flash[:error] = "Something went wrong. please try again."
			redirect_to edit_appointment_path(@appointment)
		end
	end

	def destroy
		@appointment = Appointment.find(params[:id])
		if @appointment.destroy
			flash[:notice] = "You have successfully delete appointment."
			redirect_to root_path
		else
			flash[:error] = "Something went wrong. please try again."
			redirect_to root_path
		end
	end

	def accept_appointment
		@appointment = Appointment.find(params[:id])
		if @appointment.update_attributes(is_accepted: true)
			flash[:notice] = "You have successfully accept appointment with #{@appointment.patient.name}."
			redirect_to root_path
		else
			flash[:error] = "Something went wrong. please try again."
			redirect_to root_path
		end
	end

	private

	def appointment_params
		params.require(:appointment).permit(:patient_id, :doctor_id, :note, :appointment_time)
	end
end
