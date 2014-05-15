require 'spec_helper'

describe Translator::WordnetMutator do

  it "mutates nonbanal words" do

    ["
      In the beginning God created the heaven and the earth.
      And the earth was without form, and void; and darkness was
      upon the face of the deep. And the Spirit of God moved upon
      the face of the waters.",
    ].each do |phrase|
      puts Translator::WordnetMutator.new(phrase_to_mutate: phrase).perform
    end
end

end