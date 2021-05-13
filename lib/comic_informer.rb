require "pry"
require "httparty"
require "colorize"

require_relative "./comic_informer/version"
require_relative "comic_informer/CLI"
require_relative "comic_informer/API"
require_relative "comic_informer/Publisher"
require_relative "comic_informer/comic"

module ComicInformer
  class Error < StandardError; end
  # Your code goes here...
end
