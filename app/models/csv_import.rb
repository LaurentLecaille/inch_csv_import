class CsvImport
  require 'CSV'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      yield(row.to_h)
    end
  end

  def self.update_blank_attribues(model, model_hash, updatable_attributes)
    attributes = {}
    updatable_attributes.each do |attribute|
      attributes[attribute.to_sym] = model_hash[attribute.to_sym] if model.send(attribute).blank?
    end
    model.update(attributes) unless attributes.empty?
  end
end
