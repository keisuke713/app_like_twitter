require 'sinatra'
require 'sinatra/reloader'
require 'logger'
require 'byebug'
require 'active_record'

Dir[File.expand_path('../model', __FILE__) << '/*.rb'].each do |file|
  load file
end


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './myapp.db'
);

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
end

# ルーティング

get %r{/posts/page/([0-9]+)} do
  @title = 'all_posts'
  @page_num = (params[:captures][0]).to_i
  @posts = Post.get_index_data
  erb :index_post
end

get '/posts/new' do
  @title = 'create_post'
  @post = Post.new
  erb :new_post
end

get '/posts/:id' do
  @title = 'show_post'
  @post = Post.find(params[:id])
  erb :show_post
end

post '/posts/create' do
  @post = Post.new(title: params[:title], body: params[:body])
  if @post.save
    redirect '/posts/page/1'
  else
    @post.errors.full_messages.uniq!
    erb :new_post
  end
end

get '/login' do
  erb :login
end
