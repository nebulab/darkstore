RSpec.configure do |config|
  config.before :each do
    Darkstore.configure do |c|
      c.token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwidHlwZSI6ImFwaSIsImlhdCI6MTUxMzg2NDU3MSwiZXhwIjoxNTQ1NDAwNTcxfQ.VRYGgGREykoe-O6DinWMUgSnidOni_CHbw9a-k-fETs"
    end
  end
end
