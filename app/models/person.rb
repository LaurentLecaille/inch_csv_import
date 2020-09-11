class Person < ApplicationRecord

  def self.import(file)
    ImportHelper.import(file) do |model_hash|
      
    end
  end
end
