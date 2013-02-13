module Lastfm
  class << self
    def enabled?
      Ryte.config.lastfm.present?
    end

    def username
      Ryte.config.lastfm[:username]
    end

    def url
      "http://lastfm.com/user/#{username}"
    end
  end
end
