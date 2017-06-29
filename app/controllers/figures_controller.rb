class FiguresController < ApplicationController
  set :views, 'app/views/figures'

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :new
  end

  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get 'figures/:id' do
    @figure = Figure.find(params[:id])
    erb :show
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    redirect "/figures/#{@figure.id}"
  end

end
