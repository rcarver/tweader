module Tweader
  # The Tweeter receives items, then writes and posts tweets.
  class Tweeter

    # Initialize a new Tweeter
    #
    # recipient - String name of the Twitter user to @reply.
    # twitter   - Tweader::Twitter to send the tweet.
    #
    def initialize(twitter, tweet_writer = nil)
      @twitter = twitter
      @tweet_writer = tweet_writer || Tweader::TweetWriter.new
    end

    # When an item should be tweeted, send it here.
    #
    # item - Tweader::ReaderItem to be tweeted.
    #
    # Returns nothing.
    def tweet_item(item)
      @twitter.tweet @tweet_writer.write_tweet(item)
    end
  end
end
