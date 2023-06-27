class DataStorage
    def save_data_to_json(filename, data)
   data = data.map(&:to_h)
    File.write(filename, JSON.generate(data), mode: 'w')
  end

  def load_data_from_json(filename)
    if File.exist?(filename) && File.size(filename) != 0
      json_data = JSON.parse(File.read(filename))
  
      json_data.map do |data|
        Book.new(data['title'], data['author'])
      end
    else
      []
    end
  end
end
