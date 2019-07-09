module FileManager
  def write_to_file(data)
    File.open(@file_path, 'w') { |f| f.write data.to_yaml }
  end
end
