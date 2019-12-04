class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.boolean :is_accepted, default: false
      t.integer :doctor_id
      t.integer :patient_id
      t.text :note
      t.datetime :appointment_time

      t.timestamps
    end
  end
end
