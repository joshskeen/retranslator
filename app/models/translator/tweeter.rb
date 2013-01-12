module Translator
  class Tweeter
    def initialize(args={})
      Bitly.use_api_version_3
      bitly  = Bitly.new(ENV['BITLY_USERNAME'],
                         ENV['BITLY_API_KEY'])
      @twitter = Twitter::Client.new(
        :oauth_token => ENV['TWITTER_OAUTH_TOKEN'],
        :oauth_token_secret =>ENV['TWITTER_OAUTH_TOKEN_SECRET']
      )
      ending_phrase   = args.fetch(:ending_phrase)
      translation_url = ENV['APPLICATION_URL'] + args.fetch(:translation_path)
      bitly_url       = bitly.shorten(translation_url).short_url
      @tweet          = ending_phrase.slice(0,119) + " " + bitly_url
    end

    def perform
      begin
        @twitter.update(@tweet)
      rescue Exception => e
        puts e
      end
    end
  end

end
