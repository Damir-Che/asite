class HistoriesController < ApplicationController

  def index
    @histories = History.all
  end

  def show
    @history = History.find(params[:id])
  end

  def new
    @history = History.new
  end

  def create
    @history = History.create(history_params)
    redirect_to @history
  end

  def edit
    @history = History.find(params[:id])
  end

  def update
    @history = History.find(params[:id])
    @history.update_attributes(history_params)
    redirect_to @history
  end


  def destroy
    @history = History.find(params[:id])
    @history.destroy
    redirect_to histories_path
  end



  private
  def history_params
    params.require(:history).permit(:title, :body, :source, :image)
  end

end
