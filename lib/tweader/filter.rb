module Tweader
  class Filter

    # TODO: determine if it should be tweeted via:
    # * word blacklist? "don't tweet things that mention X"
    # * source name probability? "this feed is good but too noisy, just give me some of it"
    def should_tweet?(item)
      true
    end
  end
end
