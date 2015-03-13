class MangasController < ApplicationController
  before_action :set_manga, only: [:deletecollection]
  def index
    @mangas = UserManga.all
    if params[:search]
      @mangas = UserManga.search(params[:search]).order("created_at DESC").limit(50)
    else
      @mangas = UserManga.all.order("created_at DESC").limit(50)
    end
  end

  def addcollection
    user_id = current_user.id
    manga = UserManga.find(params[:id])
    if Manga.create(title: manga.name, plot_summary: manga.plot_summary, image: manga.image)
    else
        redirect_to root_path, flash: {notice: ''}
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
