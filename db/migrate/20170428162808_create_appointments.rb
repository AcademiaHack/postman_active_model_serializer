class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :physician, foreign_key: true
      t.belongs_to :patient, foreign_key: true
      t.date :appointment_date

      t.timestamps
    end
  end
end
