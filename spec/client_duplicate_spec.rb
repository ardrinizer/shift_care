# frozen_string_literal: true

require_relative '../services/client_loader'
require_relative '../services/client_duplicate'
require 'json'

RSpec.describe ClientDuplicate do
  let(:clients) { ClientLoader.clients }
  let(:clients_with_no_duplicate) do
    [
      { "id" => 1, "full_name" => "John Doe", "email" => "john@example.com" },
      { "id" => 2, "full_name" => "Jane Doe", "email" => "jane@example.com" }
    ]
  end

  let(:duplicate_function) { ClientDuplicate.new(clients) }
  let(:duplicate_function_no_duplicate) { ClientDuplicate.new(clients_with_no_duplicate) }
  let(:duplicated_emails) { 'jane.smith@yahoo.com' }

  it 'will return list of emails including the respective names and ids' do
    result = duplicate_function.search_for_duplicate_emails

    expect(result[duplicated_emails].any?).to be_truthy
  end

  it 'prints no duplicate email found if there are no duplicated emails' do
    expect { duplicate_function_no_duplicate.search_for_duplicate_emails }.to output("No duplicate email found.\n").to_stdout
  end
end
