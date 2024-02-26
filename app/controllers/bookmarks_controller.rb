class BookmarksController < ApplicationController
before_action :set_list

  def new
    @bookmark = @list.bookmarks.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmarks = @list.bookmarks.new(bookmark_params)
    @bookmarks.save
    redirect_to lists_path(@list)

  end

  def destroy
    @bookmarks = Bookmark.find(params[:id])
    @bookmarks.destroy
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
