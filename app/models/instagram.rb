module Instagram
  class << self
    def enabled?
      Ryte.config.instagram.present?
    end

    def username
      Ryte.config.instagram[:username]
    end

    def url
      "http://instagram.com/#{username}"
    end
  end
end
