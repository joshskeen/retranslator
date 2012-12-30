# == Schema Information
#
# Table name: translations
#
#  id              :integer          not null, primary key
#  starting_phrase :text
#  ending_phrase   :text
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Translation < ActiveRecord::Base
  attr_accessible :ending_phrase, :starting_phrase, :user_id
  has_many :translation_steps
  validates :starting_phrase, presence: true, :length => {
    minimum: 1,
    maximum: 250,
    too_long: "%{count} characters is the max allowed!",
    too_short: "%{count} is too few characters!"
  }
  default_scope order('created_at DESC')
  def perform
   scrambler = Translator::Scrambler.new(phrase: starting_phrase)
   scrambler.perform
   self.ending_phrase = scrambler.result
   self.save
   TranslationStep.create_from_scrambler(id, scrambler)
  end


end
