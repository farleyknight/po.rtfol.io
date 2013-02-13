module Personal
  class << self
    def full_name
      Ryte.config.personal[:full_name]
    end

    def description
      Ryte.config.personal[:description]
    end

    def email
      Ryte.config.personal[:email]
    end

    def subject
      Ryte.config.personal[:subject_line] || "Hello"
    end

    def mailto
      "mailto:#{email}?subject=#{subject}"
    end
  end
end
