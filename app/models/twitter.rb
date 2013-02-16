module Twitter
  class << self
    def enabled?
      Ryte.config.twitter.present?
    end

    def username
      Ryte.config.twitter[:username]
    end

    def url
      "http://twitter.com/#!/#{username}"
    end


  end
end
