module Bitbucket
  class << self
    def enabled?
      Settings.bitbucket.present?
    end

    def username
      Settings.bitbucket[:username]
    end

    def url
      "http://bitbucket.org/#{username}"
    end
  end
end
