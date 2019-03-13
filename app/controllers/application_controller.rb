class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  #CREATE
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @created_rec = Recipe.create(params)
    redirect "/recipes/#{@created_rec.id}"
  end

  #INDEX/SHOW
  get '/recipes' do
    erb :index
  end

  get '/recipes/:id' do
    @lookup_recipe = Recipe.find(params[:id])
    erb :show
  end

  #UPDATE
  get '/recipes/:id/edit' do
    @lookup_recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @lookup_recipe = Recipe.find(params[:id])
    @lookup_recipe.update(params[:recipe])
    redirect "/recipes/#{@lookup_recipe.id}"
  end

  #DELETE
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect :index
  end


end
