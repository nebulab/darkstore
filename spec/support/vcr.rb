require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/support/vcr_cassettes'
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :new_episodes }
  c.allow_http_connections_when_no_cassette = true

  c.filter_sensitive_data('<email>') do |interaction|
    begin
      JSON.parse(interaction.request.body)['email']
    rescue JSON::ParserError
      nil
    end
  end

  c.filter_sensitive_data('<password>') do |interaction|
    begin
      JSON.parse(interaction.request.body)['password']
    rescue JSON::ParserError
      nil
    end
  end

  c.filter_sensitive_data('<darkstoreToken>') do |interaction|
    begin
      if interaction.response.status.code == 200
        hash_response = JSON.parse(interaction.response.body)
        hash_response['darkstoreToken'] if hash_response.is_a? Hash
      end
    rescue JSON::ParserError
      nil
    end
  end

  c.filter_sensitive_data('<Authorization Code>') do |interaction|
    interaction.request.headers['Authorization'].first
  end
end
