class Person < ApplicationRecord
  PERSON_UPDATABLE_ATTRIBUTES = %W[email home_phone_number mobile_phone_number address]


  def self.import(file)
    CsvImport.import(file) do |model_hash|
      person = Person.find_by(reference: model_hash['reference'])
      if person.nil?
        Person.create(model_hash)
      else
        CsvImport.update_attribues(person, model_hash, PERSON_UPDATABLE_ATTRIBUTES)
      end
    end
  end
end
