class Appointment < ApplicationRecord

	validates :doctor_id, :patient_id, :appointment_time, :presence => true

	def doctor
		User.find(self.doctor_id)
	end

	def patient
		User.find(self.patient_id)
	end
end
