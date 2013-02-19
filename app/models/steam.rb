module Steam
  class << self
    def enabled?
      Settings.steam.present?
    end

    def username
      Settings.steam[:username]
    end

    def url
      "http://steamcommunity.com/id/#{username}"
    end
  end
end
