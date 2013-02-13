module Bitbucket
  class << self
    def enabled?
      Ryte.config.bitbucket.present?
    end

    def username
      Ryte.config.bitbucket[:username]
    end

    def url
      "http://bitbucket.org/#{username}"
    end
  end
end
