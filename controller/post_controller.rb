get %r{/posts/page/([0-9]+)} do
  @title = 'all_posts'
  @page_num = (params[:captures][0]).to_i
  @posts = Post.get_index_data
  erb :index_post
end

get '/posts/new' do
  return redirect '/login' if log_in?

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

  return erb :new_post if @post.error_msg.size > 0

  @post.insert_data(params[:title], params[:body], session[:user_id])
  redirect '/posts/page/1'
end

get '/posts/:id/edit' do
  @title = 'edit_post'
  @post = Post.find(params[:id])
  erb :edit_post
end

post '/posts/:id/update' do
  @post = Post.find(params[:id])
  @post.check_form(params[:title], params[:body])

  return erb :edit_post if @post.error_msg.size > 0

  @post.update(title: params[:title], body: params[:body])
  redirect '/posts/page/1'
end
