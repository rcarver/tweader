require 'helper'

describe "acceptance: the client" do

  let(:recipient) { "rcarver" }
  let(:label)     { "tweader" }

  let(:twitter_client) {
    Twitter::Client.new(
      :consumer_key       => ENV['TWITTER_CONSUMER_KEY'],
      :consumer_secret    => ENV['TWITTER_CONSUMER_SECRET'],
      :oauth_token        => ENV['TWITTER_OAUTH_TOKEN'],
      :oauth_token_secret => ENV['TWITTER_OAUTH_SECRET']
    )
  }
  let(:twitter) { Tweader::Twitter.new(twitter_client) }
  let(:tweet_writer) { Tweader::TweetWriter.new(recipient) }
  let(:tweeter) { Tweader::Tweeter.new(twitter, tweet_writer) }

  let(:google_reader_api) {
    GoogleReaderApi::Api.new(
      :email    => ENV['GOOGLE_READER_EMAIL'],
      :password => ENV['GOOGLE_READER_PASSWORD'])
  }
  let(:reader) { Tweader::Reader.new(google_reader_api, label) }

  let(:client) { Tweader::Client.new(reader, tweeter) }

  it "reads and tweets" do
    begin
      client.tweet(1)
    rescue GoogleLogin::ClientLogin::BadAuthentication
      skip "Google authentication failed"
    rescue Twitter::Error::BadRequest
      skip "Twitter authentication failed"
    end
  end
end
