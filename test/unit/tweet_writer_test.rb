require 'helper'

describe Tweader::TweetWriter do

  let(:item) { 
    stub(
      source_title: "The Blog Name",
      title: "The Post Name",
      link: "http://theblog.com/post.html"
    )
  }

  describe "without a recipient" do

    subject { Tweader::TweetWriter.new }

    it "writes a tweet" do
      tweet = subject.write_tweet(item)
      tweet.must_equal "The Blog Name: The Post Name http://theblog.com/post.html"
    end
  end

  describe "with a recipient" do

    let(:recipient) { "rcarver" }
    subject { Tweader::TweetWriter.new(recipient) }

    it "writes a tweet" do
      tweet = subject.write_tweet(item)
      tweet.must_equal "@rcarver The Blog Name: The Post Name http://theblog.com/post.html"
    end
  end

end
