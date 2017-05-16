class Person < ApplicationRecord
  has_one :birth_registry
  has_many :pets
  has_many :notifications, as: :notificable
  has_and_belongs_to_many :banks

  # def birth_registry
  #   BirthRegistry.find_by(person_id: self.id)
  # end
end
