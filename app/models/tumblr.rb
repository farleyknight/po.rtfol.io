module Tumblr
  include HTTParty

  class << self
    API_URL = "http://api.tumblr.com/v2/blog/"

    def posts_url(offset = 0)
      API_URL + Ryte.config.tumblr[:api_url] + "posts?api_key=#{Ryte.config.tumber[:api_key]}&offset=#{offset}"
    end

    def posts
      get(posts_url)
    end
  end
end
