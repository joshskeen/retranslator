module ApplicationHelper

  def language_name(key)
    Translator::LANGUAGE_LIST[key.to_sym]
  end

end
