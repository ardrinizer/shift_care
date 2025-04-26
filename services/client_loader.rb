# frozen_string_literal: true

class ClientLoader
  def self.clients
    file_path = './json_file/clients.json'

    begin
      file = File.read(file_path)
      JSON.parse(file)
    rescue StandardError
      puts 'Please provide a valid json file on this directory: ./json_file/'
    end
  end
end
