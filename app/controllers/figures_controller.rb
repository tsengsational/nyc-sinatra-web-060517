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

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    # binding.pry
    erb :show
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:landmark][:name] != ""
      @landmark = Landmark.create(params[:landmark])
      @landmark.update(figure_id: @figure.id)
    elsif params[:title][:name] != ""
      @title = Title.new(params[:title])
      @title.figures << @figure
      @title.save
    elsif (params[:landmark][:name] != "") && (params[:title][:name] != "")
      @landmark = Landmark.new(params[:landmark])
      @title = Title.new(params[:title])
      @landmark.update(figure_id: @figure.id)
      @title.figures << @figure
      @title.save
    end
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    # binding.pry
    erb :edit
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params[:landmark][:name] != ""
      @landmark = Landmark.create(params[:landmark])
      @landmark.update(figure_id: @figure.id)
    elsif params[:title][:name] != ""
      @title = Title.new(params[:title])
      @title.figures << @figure
      @title.save
    elsif (params[:landmark][:name] != "") && (params[:title][:name] != "")
      @landmark = Landmark.new(params[:landmark])
      @title = Title.new(params[:title])
      @landmark.update(figure_id: @figure.id)
      @title.figures << @figure
      @title.save
    end
    redirect "/figures/#{figure.id}"
  end

  delete '/figures/:id/delete' do
    @figure = Figure.find(params[:id])
    @figure.destroy
    redirect '/figures'
  end

end
