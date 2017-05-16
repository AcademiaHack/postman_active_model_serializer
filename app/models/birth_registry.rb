class BirthRegistry < ApplicationRecord
  #belongs_to :person
  #

  def person
    Person.find_by(id: self.person_id)
  end
end
