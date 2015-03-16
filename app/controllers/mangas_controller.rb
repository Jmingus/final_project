class MangasController < ApplicationController
  before_action :set_manga, only: [:deletecollection]
  def index
    @mangas = Manga.all.page params[:page]
    if params[:search]
      @mangas = Manga.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @mangas = Manga.all.order("created_at DESC").page params[:page]
    end
  end

  def addcollection
    user_id = current_user.id
    if UserManga.create(user_id: user_id, manga_id: params[:id])
        redirect_to user_mangas_path, flash: {notice: 'Manga added to collection'}
    else
        redirect_to user_mangas_path, flash: {notice: 'Manga failed to be added'}
    end
  end

  def deletecollection

  end

  private

  def set_manga
    @manga = Manga.find(params[:id])
  end
  def manga_params
    params.require(:manga).permit(:title,:plot_summary,:image)
  end
end
