module Stackoverflow
  class << self
    def enabled?
      Ryte.config.stackoverflow.present?
    end

    def url
      "http://stackoverflow.com/users/#{user_id}/#{username}"
    end

    def user_id
      Ryte.config.stackoverflow[:user_id]
    end

    def username
      Ryte.config.stackoverflow[:username]
    end
  end
end
