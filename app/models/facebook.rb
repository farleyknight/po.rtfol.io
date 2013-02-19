module Facebook
  class << self
    def enabled?
      Settings.facebook.present?
    end

    def username
      Settings.facebook[:username]
    end

    def url
      "http://facebook.com/#{username}"
    end
  end
end
