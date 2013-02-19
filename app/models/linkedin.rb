module Linkedin
  class << self
    def enabled?
      Settings.linkedin.present?
    end
  end
end
