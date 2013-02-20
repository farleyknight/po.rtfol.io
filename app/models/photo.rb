class Photo
  def initialize(attributes)
    @attributes = attributes
  end

  def [](key)
    @attributes[key]
  end

  def caption?
    @attributes['caption'].present?
  end
end
