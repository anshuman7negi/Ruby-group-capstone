require 'json'

def save_book(data, filename)
  data_array = data.map(&:to_h)
  File.write(filename, JSON.generate(data_array))
end

def save_label(_data, filename)
  data_array = ddata.map(&:to_h)
  File.write(filename, JSON.generate(data_array))
end

def load_data(filename)
  if File.exist?(filename)
    data = File.read(filename)
    JSON.parse(data)
  else
    []
  end
end
