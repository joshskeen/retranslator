class AddFromToLanguagesToTranslationStep < ActiveRecord::Migration
  def change
    add_column :translation_steps,  :from_language, :string
    add_column :translation_steps,  :to_language, :string
  end
end
