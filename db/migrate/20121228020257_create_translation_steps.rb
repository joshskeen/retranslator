class CreateTranslationSteps < ActiveRecord::Migration
  def change
    create_table :translation_steps do |t|
      t.string :language
      t.integer :previous_translation_step
      t.integer :next_translation_step
      t.integer :translation_id
      t.text :starting_phrase
      t.text :ending_phrase
      t.timestamps
    end
  end
end
