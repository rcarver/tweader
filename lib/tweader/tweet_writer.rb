module Tweader
  class TweetWriter

    def initialize
      @max_length = 140
    end

    # Write a tweet.
    #
    # recipient - String name of the user to @reply.
    # item      - Tweader::ReaderItem to be tweeted.
    #
    # Returns a String.
    def write_tweet(recipient, item)
      "@#{recipient} #{item.source_title}: #{item.title} #{item.link}"
    end
  end
end
