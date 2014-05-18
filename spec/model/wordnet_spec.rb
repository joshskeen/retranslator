require 'spec_helper'

describe Translator::WordnetMutator do

  it "mutates nonbanal words" do
    phrase = "Zubin is part lion"
    100.times do | i |
      phrase = Translator::WordnetMutator.new(phrase_to_mutate: phrase).perform
      puts phrase
    end
    puts phrase
end

end
