class MangasController < ApplicationController
  def index
    @mangas = UserManga.all
    if params[:search]
      @mangas = UserManga.search(params[:search]).order("created_at DESC")
    else
      @mangas = UserManga.all.order("created_at DESC")
    end
  end
end
