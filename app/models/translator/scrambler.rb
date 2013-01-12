module Translator
  class Scrambler
    attr_reader :phrase, :num_steps, :translations, :result

    def initialize(args={})
      @phrase    = args.fetch(:phrase)
      @num_steps = args.fetch(:num_steps, ENV['TRANSLATOR_NUM_STEPS'].to_i)
      @translations = []
      @result = ""
      @translator = BingTranslator.new(ENV['BING_CLIENT_ID'],
                                       ENV['BING_SECRET_KEY'])
      @twitter = Twitter::Client.new(
        :oauth_token => ENV['TWITTER_OAUTH_TOKEN'],
        :oauth_token_secret =>ENV['TWITTER_OAUTH_TOKEN_SECRET']
      )
    end

    def self.random_lang(from)
      langs = Array.new(LANGUAGES).shuffle
      to = from
      while to == from
        to = langs.sample
      end
      to
    end

    def perform
      first = Result.new( translator: @translator, translations: @translations, from: :en, to: Scrambler::random_lang(:en), before: @phrase)
      first.perform
      @translations << first
      for i in 1..@num_steps
        prev    = @translations[i - 1]
        new_translation = Result.new(translator: @translator, from: prev.to, to: Scrambler::random_lang(prev.to), before: prev.after, translations: @translations)
        new_translation.perform
        puts new_translation
        @translations << new_translation
      end
      last = Result.new(translator: @translator, from: @translations.last.to, to: :en, before: @translations.last.after, translations: @translations)
      last.perform
      @translations << last
      puts "RESULT: #{last.after}"
      @result = last.after
    end

    def to_s
      "before: #{@phrase} \n after: #{@result}"
    end

  end

  class Result
    attr_reader :from, :to, :before, :after
    def initialize(args={})
      @from = args.fetch(:from)
      @to = args.fetch(:to)
      @before = args.fetch(:before)
      @translations = args.fetch(:translations)
      @translator = args.fetch(:translator)
      @after = nil
    end

    def failed?
      @after.blank?
    end

    def perform
      if @before.blank?
        last_non_blank_translation =  @translations.reverse.find{|tr| !tr.after.blank?}
        @before = last_non_blank_translation.after
        @from = last_non_blank_translation.to
        @to = Scrambler::random_lang(@from)
      end
      puts "perform #{@before} : from #{@from} to #{@to}"
      @after = @translator.translate(@before, from: @from, to: @to)
    end

    def to_s
      "from: #{@from}, to: #{@to}, before: #{@before}, after: #{@after}"
    end

  end
end
