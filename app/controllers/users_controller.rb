class UsersController < ApplicationController
  def dashboard
  end

  def profile_page
  end

  def show
    @user = current_user
    complete_currently_reading = []
    currently_reading = current_user.user_mangas.where(finished: false).pluck(:manga_id)
    currently_reading.each do |item|
      complete_currently_reading << Manga.where(id: item)
    end
    @currently_reading = complete_currently_reading
    complete_finished_list = []
    finished_list = current_user.user_mangas.where(finished: true).pluck(:manga_id)
    finished_list.each do |item|
      complete_finished_list << Manga.where(id: item)
    end
    @finished_list = complete_finished_list
  end

  def read

  end
end
