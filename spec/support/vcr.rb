require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/support/vcr_cassettes'
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :new_episodes }
  c.allow_http_connections_when_no_cassette = true

  c.filter_sensitive_data('<email>') do |interaction|
    JSON.parse(interaction.request.body)['email']
  end

  c.filter_sensitive_data('<password>') do |interaction|
    JSON.parse(interaction.request.body)['password']
  end

  c.filter_sensitive_data('<darkstoreToken>') do |interaction|
    JSON.parse(interaction.response.body)['darkstoreToken'] if interaction.response.status.code == 200
  end

  c.filter_sensitive_data('<Authorization Code>') do |interaction|
    interaction.request.headers['Authorization'].first
  end
end
