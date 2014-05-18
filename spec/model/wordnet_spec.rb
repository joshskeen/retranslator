require 'spec_helper'

describe Translator::WordnetMutator do

  it "mutates nonbanal words" do
    phrase = "Zubin is part lion"
    5.times do | i |
      phrase = Translator::WordnetMutator.new(phrase_to_mutate: phrase, lexicon: WordNet::WordNetDB).perform
      puts phrase
    end
    puts phrase
end

end
