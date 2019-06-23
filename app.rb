require 'sinatra'
require 'sinatra/reloader'
require 'logger'
require 'byebug'
require 'active_record'
enable :sessions

Dir[File.expand_path('../controller', __FILE__) << '/*.rb'].each do |file|
  load file
end

Dir[File.expand_path('../model', __FILE__) << '/*.rb'].each do |file|
  load file
end

Dir[File.expand_path('../helper', __FILE__) << '/*.rb'].each do |file|
  load file
end

Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./myapp.db"
)
