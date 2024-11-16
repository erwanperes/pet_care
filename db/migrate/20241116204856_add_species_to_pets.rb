class AddSpeciesToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :species, :string, null: false, default: 'Unknown'
  end
end
