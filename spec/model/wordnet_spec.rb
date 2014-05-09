require 'spec_helper'

describe Translator::WordnetMutator do

  it "mutates nonbanal words" do

    puts Translator::WordnetMutator.new(phrase_to_mutate: "a penny saved is a penny earned").perform

  end

end