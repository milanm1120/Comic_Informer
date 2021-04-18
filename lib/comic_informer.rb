require "pry"
require "httparty"

require_relative "./comic_informer/version"
require_relative "comic_informer/CLI"
require_relative "comic_informer/API"
require_relative "comic_informer/comics_output"

module ComicInformer
  class Error < StandardError; end
  # Your code goes here...
end
