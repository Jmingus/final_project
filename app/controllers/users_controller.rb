class UsersController < ApplicationController
  def dashboard
  end

  def profile_page
  end

  def show
    @user = current_user
    complete_finished_list = []

    finished_list = current_user.user_mangas.where(finished: true).pluck(:manga_id)
    finished_list.each do |item|
      complete_finished_list << Manga.where(id: item)
      @finished_list = complete_finished_list
    end
  end

  def read

  end
end
