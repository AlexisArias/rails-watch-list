class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.lists = @lists
    @bookmark.save
    redirect_to lists_path(@list)

  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @lists = @bookmark.lists
    @bookmark.destroy
    redirect_to lists_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
