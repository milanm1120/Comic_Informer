class ComicInformer::API
  include HTTParty
  base_uri 'api.shortboxed.com'

  def self.new_release
    get("/comics/v1/new")
  end

  # def users
  #   self.class.get("/2.2/users", @options)
  # end
end
