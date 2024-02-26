class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @lists = List.find(params[:id])
  end

  def new
    @lists = List.new
  end

  def create
    @lists = List.new(lists_params)
    @lists.save
    redirect_to lists_path(@list)
  end

  private

  def set_list
    @lists = List.find(params[:id])
  end

  def lists_params
    params.require(:list).permit(:name)
  end
end
