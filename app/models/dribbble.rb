module Dribbble
  class << self
    def enabled?
      Ryte.config.dribbble.present?
    end

    def username
      Ryte.config.dribbble[:username]
    end

    def url
      "http://dribbble.com/#{username}"
    end
  end
end
