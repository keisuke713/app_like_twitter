class Post < ActiveRecord::Base
  def self.get_post(id)
    page_num = id - 1
    skip_posts = page_num * 5
    limit(5).offset(skip_posts)
  end
end
