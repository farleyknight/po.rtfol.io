module Instagram
  class << self
    def enabled?
      Settings.instagram.present?
    end

    def username
      Settings.instagram[:username]
    end

    def url
      "http://instagram.com/#{username}"
    end
  end
end
