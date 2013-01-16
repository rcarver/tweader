module Tweader
  class TweetWriter

    # Everyone knows that a tweet is 140 characters or less.
    MAX_TWEET_SIZE = 140

    # URLs are always counted as 20 characters.
    # https://support.twitter.com/articles/78124-how-to-post-links-urls-in-tweets
    T_CO_LINK_SIZE = 20

    # Initialize a new TweetWriter.
    #
    # recipient - String name of the user to @reply.
    #
    def initialize(recipient = nil)
      @recipient = recipient
    end

    # Write a tweet.
    #
    # item - Tweader::ReaderItem to be tweeted.
    #
    # Returns a String.
    def write_tweet(item)
      prefix = @recipient ? "@#{@recipient} " : ""

      source_title = item.source_title
      title = item.title
      link = item.link
      title_delimiter = ": "
      link_delimiter = " "

      counter  = MAX_TWEET_SIZE
      counter -= prefix.size
      counter -= title_delimiter.size
      counter -= link_delimiter.size
      counter -= T_CO_LINK_SIZE

      actual  = counter
      actual -= source_title.size
      actual -= title.size

      if actual < 0
        chop = counter / 2
        source_title = source_title[0, chop]
        title = title[0, chop]
      end

      [prefix, source_title, title_delimiter, title, link_delimiter, link].join("")
    end
  end
end
