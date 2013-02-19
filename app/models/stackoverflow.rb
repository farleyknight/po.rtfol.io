module Stackoverflow
  class << self
    def enabled?
      Settings.stackoverflow.present?
    end

    def user_id
      Settings.stackoverflow[:user_id]
    end

    def username
      Settings.stackoverflow[:username]
    end

    def url
      "http://stackoverflow.com/users/#{user_id}/#{username}"
    end
  end
end
