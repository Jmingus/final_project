class UsersController < ApplicationController
  def dashboard
  end

  def profile_page
  end

  def show
    complete_currently_reading = []
    currently_reading = current_user.user_mangas.where(finished: false).pluck(:manga_id)
    currently_reading.each do |item|
      complete_currently_reading << Manga.where(id: item)
    end
      @currently_reading = complete_currently_reading

    complete_manga_finished_list = []
    finished_manga_list = current_user.user_mangas.where(finished: true).pluck(:manga_id)
    finished_manga_list.each do |item|
      complete_manga_finished_list << Manga.where(id: item)
    end
      @finished_manga_list = complete_manga_finished_list

    complete_anime_finished_list = []
    finished_anime_list = current_user.user_animes.where(finished: true).pluck(:anime_id)
    finished_anime_list.each do |item|
      complete_anime_finished_list << Anime.where(id: item)
    end
      @finished_anime_list = complete_anime_finished_list

    complete_currently_watching = []
    currently_watching = current_user.user_animes.where(finished: false).pluck(:anime_id)
    currently_watching.each do |item|
      complete_currently_watching << Anime.where(id: item)
    end
      @currently_watching = complete_currently_watching
  end

  def read

  end
end
