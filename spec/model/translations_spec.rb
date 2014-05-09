require 'spec_helper'

describe "Translation" do

  let(:starting_phrase) {
    ["A bird in the hand is worth two in the bush",
     "A penny saved is a penny earned",
     "Jack sprat could eat no fat, his wife could eat no lean",
     "Big Nerd Ranch yall"
    ].sample
  }

  it "tests the random translation" do
    Translation.new(starting_phrase: starting_phrase).perform
  end

end