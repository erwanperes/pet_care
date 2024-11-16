class Pet < ApplicationRecord
  SPECIES  = [
    "Dog",
    "Cat",
    "Rabbit",
    "Other"
  ]
  
  belongs_to :user
  belongs_to :vet, optional: true
  
  # À décommenter après création des modèles
  # has_many :vaccinations
  # has_many :treatments
  # has_many :physical_records
  # has_many :nutritions
  # has_many :activities
  has_many :vet_appointments
  
  validates :name, presence: true
  validates :species, presence: true, inclusion: { in: SPECIES }
  validates :breed, presence: true
  validates :birth_day, presence: true
  validates :gender, presence: true
end
