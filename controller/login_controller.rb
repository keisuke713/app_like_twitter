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

  return erb :login, layout: :layout_without_header if @user.error_msg.size > 0

  session[:user_id] = @user.id
  redirect '/posts/page/1'
end
