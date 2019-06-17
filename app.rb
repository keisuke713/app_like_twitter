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

helpers do
  def str_slice(text)
    "#{text.slice(0..39)}..."
  end

  def total_page
    (Post.count / 5) + 1
  end
end

get %r{/posts/page/([0-9]+)} do
  @title = 'all_posts'
  @page_num = (params[:captures][0]).to_i
  @posts = Post.get_post(@page_num)
  erb :index
end

get '/posts/:id' do
  @title = 'show_post'
  @post = Post.find(params[:id])
  erb :show
end
