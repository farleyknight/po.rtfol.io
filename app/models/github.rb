module Github
  class << self
    def enabled?
      Settings.github.present?
    end

    def username
      Settings.github[:username]
    end

    def url
      "http://github.com/#{username}"
    end

    def octokit
      @octokit ||= Octokit.user(username)
    end

    def login
      octokit[:login]
    end

    def blog
      octokit[:blog]
    end

    def gravatar_id
      octokit[:gravatar_id]
    end

    def name
      octokit[:name]
    end

    def location
      octokit[:location]
    end

    def repo_count
      octokit[:public_repo_count]
    end

    def followers
      octokit[:followers_count]
    end

    def following
      octokit[:following_count]
    end

    def repos
      @octokit_repos ||= Octokit.repos(username)
    end
  end
end
