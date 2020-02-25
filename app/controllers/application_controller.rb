class ApplicationController < ActionController::Base
  before_action :did_lose
  around_action :switch_locale



  def home_page
  end

  def did_lose
    if params[:country_id]
      country = Country.find(params[:country_id])
      if country.civ_num <= 0 || country.life_level <= 0
        country.lose = true
      end
      if country.lose? && action_name != "game_over"
        country.set_score
        redirect_to game_over_country_path(country_id: country.id)
      end
    end
  end

  def new_direction
    send_file("#{Rails.root}/public/new_direction.docx")
  end

  def hashomer_hatzair
    send_file("#{Rails.root}/public/hashomer_hatzair.docx")
  end

  private

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

end
