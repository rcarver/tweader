module Tweader
  # The Twitter client which actually posts to Twitter.
  class Twitter

    # Initialize a new Twitter.
    #
    # twitter_client - Twitter::Client.
    #
    def initialize(twitter_client)
      @twitter_client = twitter_client
    end

    # Post a new tweet to Twitter.
    #
    # message - String to post.
    #
    # Returns nothing.
    def tweet(message)
      @twitter_client.update(message)
    end
  end
end
