require 'json'
def save_book(data, filename)
  data_array = data.map(&:to_h)
  File.write(filename, JSON.generate(data_array))
end

def save_label(data, filename)
  data_array = data.map(&:to_h)
  File.write(filename, JSON.generate(data_array))
end

def save_musicalbum(data, filename)
  data_array = data.map(&:to_h)
  File.write(filename, JSON.generate(data_array))
end

def save_genre(data, filename)
  data_array = data.map(&:to_h)
  File.write(filename, JSON.generate(data_array))
end

def save_game(data, filename)
  data_array = data.map(&:to_h)
  File.write(filename, JSON.generate(data_array))
end

def save_author(data, filename)
  data_array = data.map(&:to_h)
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
