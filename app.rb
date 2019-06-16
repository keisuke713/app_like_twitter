require 'sinatra'
require 'sinatra/reloader'
require 'logger'
require 'byebug'
require 'active_record'

Dir[File.expand_path('../model', __FILE__) << '/*.rb'].each do |file|
  require file
end

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './myapp.db'
);

get '/' do
  @title = 'all_tweets'
  @posts = Post.all
  erb :index
end
