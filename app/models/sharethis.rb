module Sharethis
  class << self
    def enabled?
      Settings.sharethis.present?
    end

    def facebook?
      Settings.sharethis[:facebook]
    end

    def twitter?
      Settings.sharethis[:twitter]
    end

    def linkedin?
      Settings.sharethis[:linkedin]
    end

    def google_plus?
      Settings.sharethis[:google_plus]
    end

    def sharethis?
      Settings.sharethis[:sharethis]
    end

    def email?
      Settings.sharethis[:email]
    end
  end
end
