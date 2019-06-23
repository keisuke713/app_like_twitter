class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessor :error_msg

  def check_form(title, body)
    @error_msg = []
    @error_msg << "Title can't be blank" if title.empty?
    @error_msg << "Body can't be blank" if body.empty?
  end

  def insert_data(title, body, user_id)
    self.title = title
    self.body = body
    self.user_id = user_id
    self.save
  end

  def self.get_index_data
    Post.all.order("updated_at DESC, id DESC")
  end
end
