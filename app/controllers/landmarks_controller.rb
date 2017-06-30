class LandmarksController < ApplicationController
  set :views, 'app/views/landmarks'

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    erb :new
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect "/landmark/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :edit
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end

  delete '/landmarks/:id/delete' do
    @landmark = Figure.find(params[:id])
    @landmark.destroy
    redirect '/landmarks'
  end

end
