module Facebook
  class << self
    def enabled?
      Ryte.config.facebook.present?
    end

    def username
      Ryte.config.facebook[:username]
    end

    def url
      "http://facebook.com/#{username}"
    end
  end
end
