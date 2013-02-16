class Post
  include ActionView::Helpers::SanitizeHelper

  def initialize(attributes = {})
    @id      = attributes['ID']
    @title   = attributes['title']
    @body    = attributes['content']
    @excerpt = attributes['excerpt']
    @date    = Date.parse attributes['date']
    @tags    = attributes['tags']
  end

  def id
    @id
  end

  alias :to_param :id

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

  def excerpt
    @excerpt
  end

  def body
    @body
  end

  def meta_description
    strip_tags(@body)[0..150]
  end

  def keywords
    @tags.values.join(", ")
  end

  def title
    @title
  end

  class << self
    def find(post_id)
      Post.new(Wordpress.find(post_id))
    end

    def wordpress
      Wordpress.posts.parsed_response["posts"].map do |post|
        Post.new(post)
      end
    end

    def all
      wordpress
    end
  end
end
