module Tumblr
  class << self
    def enabled?
      Settings.tumblr.present?
    end

    def posts_url
      "http://tumblr-api.herokuapp.com/#{blog_name}"
    end

    def blog_name
      Settings.tumblr[:url].gsub(".tumblr.com", "")
    end

    def request_posts
      HTTParty.get(posts_url)
    end

    def posts
      request_posts.parsed_response["posts"]
    end
  end
end
