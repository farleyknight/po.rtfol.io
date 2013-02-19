module Foursquare
  class << self
    def enabled?
      Settings.foursquare.present?
    end

    def url
      if username.present?
        "http://foursquare.com/#{username}"
      else
        "http://foursquare.com/user/#{user_id}"
      end
    end

    def username
      Settings.foursquare[:username]
    end

    def user_id
      Settings.foursquare[:user_id]
    end
  end
end
