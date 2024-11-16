class AddIndexesToVets < ActiveRecord::Migration[7.1]
  def change
    add_index :vets, :email, unique: true
    add_index :vets, [:first_name, :last_name]
  end
end
