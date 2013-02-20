class Wordpress
  class << self
    def enabled?
      Settings.wordpress.present?
    end

    def url
      Settings.wordpress[:url]
    end

    def posts_url
      "https://public-api.wordpress.com/rest/v1/sites/#{url}/posts"
    end

    def request_posts
      HTTParty.get(posts_url)
    end

    def posts
      request_posts.parsed_response["posts"]
    end

    def post_url(post_id)
      posts_url + "/" + post_id.to_s
    end

    def find(post_id)
      HTTParty.get(post_url(post_id))
    end
  end
end
