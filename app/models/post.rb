class Post < ActiveRecord::Base
  validates_presence_of :title, :body, :author, :pubdate

  before_save :create_permalink

  def to_param
    permalink
  end

  def create_permalink
    self.permalink = title.parameterize
  end

end
