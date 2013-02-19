module Lastfm
  class << self
    def enabled?
      Settings.lastfm.present?
    end

    def username
      Settings.lastfm[:username]
    end

    def url
      "http://lastfm.com/user/#{username}"
    end
  end
end
