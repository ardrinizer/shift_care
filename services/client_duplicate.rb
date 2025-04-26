# frozen_string_literal: true

class ClientDuplicate
  require 'json'

  def initialize(clients)
    @clients ||= clients
  end

  def search_for_duplicate_emails
    grouped_by_email = @clients.group_by { |client| client['email'] }
    duplicate_clients = grouped_by_email.select { |key, value| value.size > 1 }

    if duplicate_clients.any?
      puts 'Clients with duplicate emails:'

      duplicate_clients.each do |email, list_of_clients|
        puts "Email: #{email}"

        list_of_clients.each do |client|
          puts "ID: #{client['id']}, Name: #{client['full_name']}"
        end

        puts '-----------------------------------'

        # For rspec testing
        {
          email: email,
          clients: [
            list_of_clients
          ]
        }
      end
    else
      puts 'No duplicate email found.'
    end
  end
end
