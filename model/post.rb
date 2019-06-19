class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body,  presence: true

  def self.get_index_data
    all.order("updated_at DESC, id DESC")
  end
end
