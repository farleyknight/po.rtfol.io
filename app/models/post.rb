class Post
  def initialize(attributes = {})
    @id = attributes['ID']
    @title = attributes['title']
    @body = attributes['content']
    @date = Date.parse attributes['date']
    @tags = attributes['tags']
  end

  def id
    @id
  end

  def show_more?
    true
  end

  def tags?
    @tags.present?
  end

  def tags
    @tags
  end

  def formatted_date
    @date.strftime("%B %d, %Y")
  end

  def body
    @body
  end

  def title
    @title
  end

  def self.wordpress
    Wordpress.posts.parsed_response["posts"].map do |post|
      Post.new(post)
    end
  end

  def self.all
    wordpress
  end
end
