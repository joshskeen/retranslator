module Translator
  class WordnetMutator

    def initialize(args={})
      @lexicon = WordNet::Lexicon.new
      @phrase = args.fetch(:phrase_to_mutate, "")
    end

    def wordnetify_phrase(phrase)
      @phrase = phrase
      perform
    end

    def wordnetify(word)
      syn = @lexicon.lookup_synsets word
      return false if syn.to_a.empty?
      words = syn.sample.words
      return false if words.to_a.empty?
      lemma = words.sample.lemma
      return false if lemma.nil?
      lemma
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
