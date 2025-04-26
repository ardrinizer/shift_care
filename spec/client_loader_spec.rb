# frozen_string_literal: true

require_relative '../services/client_loader'
require 'json'

RSpec.describe ClientLoader do
  let(:valid_data) {
    [
      {
        "id": 1,
        "full_name": "John Doe",
        "email": "john.doe@gmail.com"
      }
    ]
  }

  let(:invalid_error) { "Please provide a valid json file on this directory: ./json_file/\n" }

  it 'loads valid JSON' do
    allow(File).to receive(:read).and_return(valid_data.to_json)
    expect(ClientLoader.clients).to be_an(Array)
  end

  it 'loads invalid content' do
    allow(File).to receive(:read).and_return('invalid content')
    expect { ClientLoader.clients }.to output(invalid_error).to_stdout
  end

  it 'returns an error if invalid json file or invalid content' do
    allow(File).to receive(:read).and_raise(StandardError)
    expect { ClientLoader.clients }.to output(invalid_error).to_stdout
  end
end
