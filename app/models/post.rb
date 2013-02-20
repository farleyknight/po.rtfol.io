class Post
  include ActionView::Helpers::SanitizeHelper

  attr_accessor :attributes

  def initialize(attributes = {})
    @attributes = attributes
    @id         = attributes['ID'] || attributes['id']
    @title      = attributes['title']
    @body       = attributes['content']
    @excerpt    = attributes['excerpt']
    @date       = Date.parse attributes['date']
    @tags       = attributes['tags']
    @type       = attributes['type'] || "text"
    @caption    = attributes['caption']
    @photos     = attributes['photos'].map {|hash| Photo.new(hash["original_size"]) }
  end

  #
  # @group type
  #

  def text?
    @type == "text"
  end

  def photo?
    @type == "photo"
  end

  #
  # @group id
  #

  def id
    @id
  end

  alias :to_param :id

  #
  # @group photos
  #

  def photos
    @photos
  end

  def photo
    photos.first
  end

  #
  # @group caption
  #

  def caption
    @caption
  end

  def caption?
    @caption.present?
  end

  #
  # @group tags
  #

  def tags?
    @tags.present?
  end

  def tags
    @tags
  end

  #
  # @group content
  #

  def show_more?
    @body.present?
  end

  def excerpt
    @excerpt
  end

  def body
    @body
  end

  #
  # @group meta
  #

  def formatted_date
    @date.strftime("%B %d, %Y")
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

  class NoBloggingPlatform < Exception; end

  class << self
    def source
      if ::Wordpress.enabled?
        ::Wordpress
      elsif ::Tumblr.enabled?
        ::Tumblr
      else
        raise NoBloggingPlatform.new("No blogging platform has been picked!")
      end
    end

    def find(post_id)
      new(source.find(post_id))
    end

    def all
      source.posts.map do |post|
        Post.new(post)
      end
    end
  end
end
