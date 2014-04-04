get '/' do
  erb :index
end

post '/' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
    session[:id] = @user.id
    redirect'/'
  else
    redirect '/'
  end
end

get '/users/new' do
  erb :signup
end

post '/users' do
  @user = User.new(email: params[:email])
  @user.password = params[:password]
  @user.save!

  redirect '/'
end

delete '/' do
  session.delete(:id)
  redirect '/'
end
