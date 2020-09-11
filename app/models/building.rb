class Building < ApplicationRecord
  BUILDING_UPDATABLE_ATTRIBUTES = %W[manager_name]


  def self.import(file)
    CSVImport.import(file) do |model_hash|
      building = Building.find_by(address: model_hash['address'] , zip_code: model_hash['zip_code'], city: model_hash['city'])
      if building.nil?
        Building.create(model_hash)
      else
        CSVImport.update_blank_attribues(building, model_hash, BUILDING_UPDATABLE_ATTRIBUTES)
      end
    end
  end
end
