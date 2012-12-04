module Tweader
  class TweetWriter

    # Initialize a new TweetWriter.
    #
    # recipient - String name of the user to @reply.
    #
    def initialize(recipient = nil)
      @recipient = recipient
      @max_length = 140
    end

    # Write a tweet.
    #
    # item - Tweader::ReaderItem to be tweeted.
    #
    # Returns a String.
    def write_tweet(item)
      prefix = @recipient ? "@#{@recipient} " : ""
      "#{prefix}#{item.source_title}: #{item.title} #{item.link}"
    end
  end
end
