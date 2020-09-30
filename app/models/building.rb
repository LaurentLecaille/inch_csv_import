class Building < ApplicationRecord
  BUILDING_UPDATABLE_ATTRIBUTES = %W[manager_name]


  def self.import(file)
    CsvImport.import(file) do |model_hash|
      building = Building.find_by(reference: model_hash['reference'])
      if building.nil?
        Building.create(model_hash)
      else
        CsvImport.update_attribues(building, model_hash, BUILDING_UPDATABLE_ATTRIBUTES)
      end
    end
  end
end
