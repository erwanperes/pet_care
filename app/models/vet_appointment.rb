class VetAppointment < ApplicationRecord
 belongs_to :pet
 belongs_to :vet
 
 # Enum pour le status
 enum status: {
   pending: 'pending',
   confirmed: 'confirmed',
   completed: 'completed',
   cancelled: 'cancelled'
 }, _default: 'pending'
 
 # Validations
 validates :date, presence: true
 validates :reason, presence: true
 validates :status, presence: true, inclusion: { in: statuses.keys }
 
 # Si tu veux que la date soit future
 validate :date_cannot_be_in_the_past, on: :create
 
 private
 
 def date_cannot_be_in_the_past
   if date.present? && date < Date.current
     errors.add(:date, "ne peut pas être dans le passé")
   end
 end
end
