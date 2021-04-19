class ComicInformer::API
  include HTTParty
  base_uri 'api.shortboxed.com'

  def self.new_release
    get('/comics/v1/new')
  end

  def self.future_release
    get("/comics/v1/future")
  end

  def self.last_week_release
    get("/comics/v1/previous")
  end

end
