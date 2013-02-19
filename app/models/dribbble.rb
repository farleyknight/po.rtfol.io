module Dribbble
  class << self
    def enabled?
      Settings.dribbble.present?
    end

    def username
      Settings.dribbble[:username]
    end

    def url
      "http://dribbble.com/#{username}"
    end
  end
end
