require 'sinatra'
require 'sinatra/reloader'
require 'logger'
require 'byebug'
require 'active_record'
enable :sessions

Dir[File.expand_path('../model', __FILE__) << '/*.rb'].each do |file|
  load file
end

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./myapp.db"
)

# ヘルパー

helpers do
  def str_slice(text)
    "#{text.slice(0..39)}..."
  end

  def data_range(num)
    first_count = 5  * (num - 1)
    last_count = 5 * num -1
    (first_count..last_count)
  end

  def total_page
    (Post.count / 5) + 1
  end

  def user_id
    session[:user_id]
  end
end

# ルーティング

get %r{/posts/page/([0-9]+)} do
  @title = 'all_posts'
  @page_num = (params[:captures][0]).to_i
  @posts = Post.get_index_data
  # @posts = Post.
  erb :index_post
end

get '/posts/new' do
  @title = 'create_post'
  @post = Post.new
  @error_message = []
  erb :new_post
end

get '/posts/:id' do
  @title = 'show_post'
  @post = Post.find(params[:id])
  erb :show_post
end

post '/posts/create' do
  @post = Post.new
  @post.check_form(params[:title], params[:body])

  if @post.error_msg.size > 0
    return erb :new_post
  end

  @post.insert_data(params[:title], params[:body], session[:user_id])
  redirect '/posts/page/1'
end

get '/login' do
  @user = User.new
  erb :login, layout: :layout_without_header
end

post '/login' do
  @user = User.find_by(name: params[:name])
  if @user.nil?
    @user = User.new
  end
  @user.login_check(params[:name], params[:password])

  if @user.error_msg.size == 0
    session[:user_id] = @user.id
    redirect '/posts/page/1'
  else
    erb :login
  end
end

get '/signup' do
  @title = 'signup'
  @user = User.new
  erb :signup, layout: :layout_without_header
end

post '/signup' do
  @user = User.new
  @user.signup_check(params[:name], params[:password])
  if @user.error_msg.size > 0
    return erb :signup
  end

  @user.insert_data(params[:name], params[:password])
  session[:user_id] = @user.id
  redirect '/posts/page/1'
end

get %r{/users/[0-9]+} do
  @user = User.find(user_id)
  erb :user, layout: :layout_without_header
end
