get '/signup' do
  @title = 'signup'
  @user = User.new
  erb :signup, layout: :layout_without_header
end

post '/signup' do
  @user = User.new
  @user.signup_check(params[:name], params[:password])

  return erb :signup, layout: :layout_without_header if @user.error_msg.size > 0

  @user.insert_data(params[:name], params[:password])
  session[:user_id] = @user.id
  redirect '/posts/page/1'
end

get '/logout' do
  session.clear
  redirect '/posts/page/1'
end

get %r{/users/[0-9]+} do
  @user = User.find(user_id)
  erb :user, layout: :layout_without_header
end
