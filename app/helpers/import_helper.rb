module ImportHelper
  require 'CSV'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      yield(row.to_h)
    end
  end
end
