module Linkedin
  class << self
    def enabled?
      Ryte.config.linkedin.present?
    end
  end
end
