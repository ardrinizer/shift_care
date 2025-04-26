# frozen_string_literal: true

require 'json'
require_relative 'services/client_loader'
require_relative 'services/client_search'
require_relative 'services/client_duplicate'

def clients
  ClientLoader.clients
end

def search(keyword)
  search_function = ClientSearch.new(clients)
  search_function.search_by_name(keyword)
end

def duplicate
  duplicate_function = ClientDuplicate.new(clients)
  duplicate_function.search_for_duplicate_emails
end

# Command line arguments
command = ARGV[0]

case command
when 'search'
  keyword = ARGV[1]

  if keyword.nil?
    puts 'Please provide a keyword.'
  else
    search(keyword)
  end
when 'duplicate'
  duplicate
else
  puts 'Invalid command.'
  puts 'Search: ruby main.rb search <keyword>'
  puts 'Duplicate: ruby main.rb duplicate'
end
