module Tweader
  class Client

    def initialize(reader, tweeter, filter = nil)
      @reader = reader
      @tweeter = tweeter
      @filter = filter || Tweader::Filter.new
    end

    def tweet(limit = 5)
      @reader.unread_items(limit).each do |item|
        if @filter.should_tweet?(item)
          @tweeter.tweet_item(item)
          item.mark_tweeted!
        end
      end
    end

  end
end
