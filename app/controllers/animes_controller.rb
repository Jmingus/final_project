class AnimesController < ApplicationController
  before_action :set_anime, only: [:deletecollection]
  def index
    @animes = Anime.all
    if params[:search]
      @animes = Anime.search(params[:search]).order("created_at DESC").limit(50)
    else
      @animes = Anime.all.order("created_at DESC").limit(50)
    end
  end

  def addcollection
    user_id = current_user.id
    if UserAnime.create(user_id: user_id, anime_id: params[:id])
      redirect_to user_animes_path, flash: {notice: 'Anime added to collection'}
    else
      redirect_to user_animes_path, flash: {notice: 'Anime failed to be added'}
    end
  end

  def deletecollection

  end

  private

  def set_anime
    @anime = Anime.find(params[:id])
  end
  def anime_params
    params.require(:anime).permit(:title,:plot_summary,:image)
  end
end

