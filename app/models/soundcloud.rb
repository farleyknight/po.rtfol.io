module Soundcloud
  class << self
    def enabled?
      Settings.soundcloud.present?
    end

    def username
      Settings.soundcloud[:username]
    end

    def url
      "http://soundcloud.com/#{username}"
    end
  end
end
