class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    #sinatra does this for us?
    @r=Recipe.create(params)
    redirect "/recipes/#{@r.id}"
  end

  get '/recipes' do
    @rs=Recipe.all
    erb :index
  end

  get '/recipes/:id' do
     @r = Recipe.find_by_id(params[:id])
     erb :show
  end

  get '/recipes/:id/edit' do
    @r = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @r=Recipe.find(params[:id])
    @r.update(name: params[:name])
    @r.update(ingredients: params[:ingredients])
    @r.update(cook_time: params[:cook_time])
    redirect "/recipes/#{params[:id]}"
  end

  delete '/recipes/:id' do
    Recipe.find(params[:id]).destroy
    redirect '/recipes'
  end

end
