module Wordpress
  include HTTParty

  class << self
    API_URL = "https://public-api.wordpress.com/rest/v1/sites/"

    def posts_url
      API_URL + Ryte.config.wordpress[:url] + "/posts"
    end

    def posts
      get(posts_url)
    end
  end
end
