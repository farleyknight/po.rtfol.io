module Soundcloud
  class << self
    def enabled?
      Ryte.config.soundcloud.present?
    end

    def username
      Ryte.config.soundcloud[:username]
    end

    def url
      "http://soundcloud.com/#{username}"
    end
  end
end
