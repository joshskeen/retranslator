module Translator
  require 'wordnet'
  include WordNet

  def self.wordnet_instance
    WordNet::WordNetDB.path = Rails.public_path + "/WordNet-3.0/"
    WordNet::WordNetDB
  end

  LANGUAGE_LIST = {
      ar: "Arabic",
      ja: "Japanese",
      bg: "Bulgarian",
      ko: "Korean",
      ca: "Catalan",
      lv: "Latvian",
      lt: "Lithuanian",
      no: "Norwegian",
      cs: "Czech",
      fa: "Persian",
      da: "Danish",
      pl: "Polish",
      nl: "Dutch",
      pt: "Portuguese",
      en: "English",
      ro: "Romanian",
      et: "Estonian",
      ru: "Russian",
      fi: "Finnish",
      sk: "Slovak",
      fr: "French",
      sl: "Slovenian",
      de: "German",
      es: "Spanish",
      el: "Greek",
      sv: "Swedish",
      ht: "Haitian Creole",
      th: "Thai",
      he: "Hebrew",
      tr: "Turkish",
      hi: "Hindi",
      uk: "Ukrainian",
      mww: "Hmong Daw",
      vi: "Vietnamese",
      hu: "Hungarian",
      ur: "Urdu",
      cy: "Welsh",
      ms: "Malay",
      tlh: "Klingon"
  }.freeze

  LANGUAGES = LANGUAGE_LIST.keys
  NUM_STEPS = 15

end
