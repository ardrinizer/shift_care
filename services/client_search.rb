# frozen_string_literal: true

class ClientSearch
  require 'json'

  def initialize(clients)
    @clients ||= clients
  end

  def search_by_name(keyword)
    # Use select to filter those clients with matching names
    if keyword.nil?
      puts 'Please provide a keyword.'
      return
    end

    results = @clients.select { |client| client['full_name'].downcase.include?(keyword.downcase) }

    if results.any?
      list_of_names = results.map { |client| client['full_name'] }.join(', ')
      puts "Names of clients: #{list_of_names}"

      # For rspec testing
      list_of_names
    else
      puts 'No client found.'
    end
  end
end
