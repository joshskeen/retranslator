# == Schema Information
#
# Table name: translation_steps
#
#  id                        :integer          not null, primary key
#  language                  :string(255)
#  previous_translation_step :integer
#  next_translation_step     :integer
#  translation_id            :integer
#  starting_phrase           :text
#  ending_phrase             :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  from_language             :string(255)
#  to_language               :string(255)
#

class TranslationStep < ActiveRecord::Base
  attr_accessible :language, :next_translation_step, :previous_translation_step, :translation_id, :starting_phrase, :ending_phrase, :from_language, :to_language


  def self.create_from_scrambler(translation_id, scrambler)
    scrambler.translations.each do | step |
      ts = TranslationStep.new(
                                translation_id: translation_id,
                                from_language: step.from,
                                to_language: step.to,
                                starting_phrase: step.before,
                                ending_phrase: step.after)
      ts.save

    end
  end

end
