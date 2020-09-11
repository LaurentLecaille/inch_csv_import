class Person < ApplicationRecord
  USER_UPDATABLE_ATTRIBUTES = %W[email home_phone_number mobile_phone_number address]


  def self.import(file)
    CsvImport.import(file) do |model_hash|
      person = Person.find_by(firstname: model_hash['firstname'] , lastname: model_hash['lastname'])
      if person.nil?
        Person.create(model_hash)
      else
        CsvImport.update_blank_attribues(person, model_hash, USER_UPDATABLE_ATTRIBUTES)
      end
    end
  end
end
