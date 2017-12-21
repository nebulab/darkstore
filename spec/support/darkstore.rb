RSpec.configure do |config|
  config.before :each do
    Darkstore.configure do |c|
      c.token = "TOKEN"
    end
  end
end
