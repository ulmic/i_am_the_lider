class News < ActiveRecord::Base
  attr_accessible :body, :pusblished_at, :title

  validates_presence_of :body, :pusblished_at, :title
  validates_length_of :title, :maximum => 140
end
