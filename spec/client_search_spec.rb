require_relative '../services/client_loader'
require_relative '../services/client_search'
require 'json'

RSpec.describe ClientSearch do
  let(:clients) { ClientLoader.clients }
  let(:search_function) { ClientSearch.new(clients) }
  let(:keyword) { 'lia' }

  it 'finds names that include the keyword' do
    result = search_function.search_by_name(keyword)

    expect(result).to include('Michael Williams').or include('Amelia Hall')
  end

  it 'should returns no client found if no match' do
    expect { search_function.search_by_name('nonexistent') }.to output("No client found.\n").to_stdout
  end

  it 'should return please provide a keyword if no keyword passed' do
    expect { search_function.search_by_name(nil) }.to output("Please provide a keyword.\n").to_stdout
  end
end
