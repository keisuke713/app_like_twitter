require 'digest/md5'

class User < ActiveRecord::Base
  has_many :posts
  attr_accessor :error_msg

  def signup_check(name, password)
    @error_msg = []
    @error_msg << "Name can't be blank" if name.empty?
    return @error_msg << "Passowrd can't be blank" if password.empty?
    @error_msg << "Password is too short" if password.length < 8
  end

  def insert_data(name, password)
    self.name = name
    self.password = password_to_digest(password)
    self.save
  end

  def login_check(name, password)
    @error_msg = []
    return @error_msg << "#{name} doesn't exist" if self.name.nil?
    if self.password != password_to_digest(password)
      @error_msg << "Password isn't correct"
    end
  end

  private

  def password_to_digest(password)
    Digest::MD5.hexdigest(password)
  end
end
