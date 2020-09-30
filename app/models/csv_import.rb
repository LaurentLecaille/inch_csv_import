class CsvImport
  require 'CSV'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      yield(row.to_h)
    end
  end

  def self.update_attribues(model, model_hash, updatable_attributes)
    attributes = {}
    puts '/////////////'
    updatable_attributes.each do |attribute|
      unless model.send(attribute.to_sym).eql? model_hash[attribute]
        puts "updating #{model.class}##{attribute} replacing : #{model.send(attribute.to_sym)} by #{model_hash[attribute]}"
        attributes[attribute.to_sym] = model_hash[attribute]
      end
    end
    puts '/////////////'
    model.update(attributes) unless attributes.empty?
  end
end
