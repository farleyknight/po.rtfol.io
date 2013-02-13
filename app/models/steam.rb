module Steam
  class << self
    def enabled?
      Ryte.config.steam.present?
    end

    def username
      Ryte.config.steam[:username]
    end

    def url
      "http://steamcommunity.com/id/#{username}"
    end
  end
end
