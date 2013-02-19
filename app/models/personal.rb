module Personal
  class << self
    def full_name
      Settings.personal[:full_name]
    end

    def description
      Settings.personal[:description]
    end

    def email
      Settings.personal[:email]
    end

    def subject
      Settings.personal[:subject_line] || "Hello"
    end

    def mailto
      "mailto:#{email}?subject=#{subject}"
    end
  end
end
