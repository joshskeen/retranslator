module Translator
  class WordnetMutator

    def initialize(args={})
      @lexicon = args.fetch(:lexicon)
      @phrase = args.fetch(:phrase_to_mutate, "")
    end

    def wordnetify_phrase(phrase)
      @phrase = phrase
      perform
    end

    def wordnetify(word)
      @lexicon.find(word)
      wordnetified = @lexicon.find(word)
      .flat_map(&:synsets)
      .flat_map(&:hyponym)
      .flat_map(&:words)
      .sample
      wordnetified.nil? ? false : wordnetified.gsub("_", " ")
    end

    def perform
      result = []
      resultant = ""
      @phrase.split.each_with_index do |word, index|
        resultant = word
        if (word =~ /\b(is|of|the|a|that|this|it)\b/).nil?
          wordnetified = wordnetify(resultant)
          if wordnetified
            resultant = wordnetified
          end
        end
        result << resultant
      end
      result.join " "
    end

  end
end
