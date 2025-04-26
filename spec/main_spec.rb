require_relative '../main'
require 'json'

RSpec.describe 'main.rb' do
  let(:invalid_error) { "Invalid command.\nSearch: ruby main.rb search <keyword>\nDuplicate: ruby main.rb duplicate\n" }

  it 'when no command is passed' do
    ARGV.replace([''])
    expect{ load './main.rb' }.to output(invalid_error).to_stdout
  end

  it 'when invalid command is passed' do
    ARGV.replace(['invalid'])
    expect{ load './main.rb' }.to output(invalid_error).to_stdout
  end
end
