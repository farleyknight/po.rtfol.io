module Foursquare
  class << self
    def enabled?
      Ryte.config.foursquare.present?
    end

    def url
      if username.present?
        "http://foursquare.com/#{username}"
      else
        "http://foursquare.com/user/#{user_id}"
      end
    end

    def username
      Ryte.config.foursquare[:username]
    end

    def user_id
      Ryte.config.foursquare[:user_id]
    end
  end
end
