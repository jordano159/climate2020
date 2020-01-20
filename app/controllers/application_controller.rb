class ApplicationController < ActionController::Base
  before_action :did_lose

  def home_page
  end

  def game_over
  end

  def did_lose
    if params[:country_id]
      country = Country.find(params[:country_id])
      if country.civ_num <= 0 || country.life_level <= 0
        country.lose = true
      end
      if country.lose?
        redirect_to game_over_path
      end

    end
  end

end
