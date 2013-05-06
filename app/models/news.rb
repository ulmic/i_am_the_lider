class News < ActiveRecord::Base
  attr_accessible :body, :pusblished_at, :title
end
