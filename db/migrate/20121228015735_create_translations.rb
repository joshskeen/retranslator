class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.text :starting_phrase
      t.text :ending_phrase
      t.integer :user_id
      t.timestamps
    end
  end
end
