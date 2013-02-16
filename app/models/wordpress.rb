class Wordpress
  include HTTParty

  class << self
    API_URL = "https://public-api.wordpress.com/rest/v1/sites/"

    def posts_url
      API_URL + Ryte.config.wordpress[:url] + "/posts"
    end

    def posts
      get(posts_url)
    end

    def post_url(post_id)
      posts_url + "/" + post_id.to_s
    end

    def find(post_id)
      get(post_url(post_id))
    end
  end
end
