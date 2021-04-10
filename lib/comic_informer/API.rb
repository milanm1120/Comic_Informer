class ComicInformer::API
  include HTTParty
  base_uri 'api.shortboxed.com'

  @@new = []
  @@future = []
  @@previous = []

  def self.new_release
    @@new << get("/comics/v1/new").to_yaml
    puts @@new, ""
  end

  def self.future_release
    @@future << get("/comics/v1/future").to_yaml
    puts @@future, ""
  end

  def self.last_week_release
    @@previous << get("/comics/v1/previous").to_yaml
    puts @@previous, ""
  end

end
