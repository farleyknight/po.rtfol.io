module Twitter
  class Account
    class Tweet
      attr_reader :text

      def initialize(attributes)
        @text = attributes['text']
        @created_at = Date.parse attributes['created_at']
      end

      def formatted_date
        @created_at.strftime("%B %d, %Y")
      end
    end

    attr_reader :url, :name, :profile_image_url, :location, :statuses_count, :friends_count, :followers_count, :description

    def initialize(attributes)
      @url               = attributes["url"]
      @name              = attributes["name"]
      @description       = attributes["description"]
      @profile_image_url = attributes["profile_image_url"]
      @location          = attributes["location"]
      @statuses_count    = attributes["statuses_count"]
      @friends_count     = attributes["friends_count"]
      @followers_count   = attributes["followers_count"]
    end

    def tweet_data_url
      "http://twitter-api.herokuapp.com/account/#{Twitter.username}/timeline.json"
    end

    def tweet_data
      @tweet_data ||= HTTParty.get(tweet_data_url)
    end

    def tweets
      @tweets ||= tweet_data.map {|t| Tweet.new(t) }
    end
  end

  class << self
    def enabled?
      Settings.twitter.present?
    end

    def username
      Settings.twitter[:username]
    end

    def screen_name
      username
    end

    def url_for(username)
      "http://twitter-api.herokuapp.com/account/#{username}.json"
    end

    def account
      @account ||= Twitter::Account.new(HTTParty.get(url_for(username)))
    end

    def url
      "http://twitter.com/#!/#{username}"
    end

    def account_url?
      account.url.present?
    end

    def account_url
      account.url
    end

    def profile_image_url
      account.profile_image_url
    end

    def description
      account.description
    end

    def name
      account.name
    end

    def location?
      account.location.present?
    end

    def location
      account.location
    end

    def profile_image_url
      account.profile_image_url
    end

    def statuses_count
      account.statuses_count
    end

    def followers_count
      account.followers_count
    end

    def friends_count
      account.friends_count
    end

    def tweets
      account.tweets
    end
  end
end
