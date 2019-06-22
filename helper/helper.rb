# ヘルパー
module ViewHelper
  def str_slice(text)
    return "#{text.slice(0..39)}..." if text.size >= 39
    text
  end

  def data_range(num)
    first_count = 5  * (num - 1)
    last_count = 5 * num -1
    (first_count..last_count)
  end

  def total_page
    (Post.count / 5) + 1
  end
end

module ModelHelper
  def user_id
    session[:user_id]
  end

  def current_user
    User.find_by(id: user_id)
  end

  def log_in?
    current_user.nil?
  end
end

module LoginHelper
end

helpers ViewHelper, ModelHelper, LoginHelper
