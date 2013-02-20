module Disqus
  class << self
    def enabled?
      Settings.disqus.present?
    end
  end
end
