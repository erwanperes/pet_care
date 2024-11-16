class AddIndexesToVetAppointments < ActiveRecord::Migration[7.1]
  def change
    add_index :vet_appointments, :date
    add_index :vet_appointments, :status
    add_index :vet_appointments, [:pet_id, :date]
    add_index :vet_appointments, [:vet_id, :date]
  end
end