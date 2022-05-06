class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params_bookmarks)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def params_bookmarks
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end