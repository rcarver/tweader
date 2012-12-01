require 'helper'

describe "acceptance: the client" do

  let(:recipient) { "rcarver" }
  let(:twitter) { Tweader::Twitter.new }
  let(:api)     { GoogleReaderApi::Api.new(:email => ENV['GREMAIL'], :password => ENV['GRPASSWORD']) }
  let(:reader)  { Tweader::Reader.new(api) }
  let(:tweeter) { Tweader::Tweeter.new(recipient, twitter) }
  let(:client)  { Tweader::Client.new(reader, tweeter) }

  it "reads and tweets" do
    client.tweet(5)
  end
end
