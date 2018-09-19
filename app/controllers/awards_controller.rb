class AwardsController < ApplicationController
  before_action :require_admin, only: [:create]

  def index
    @awards = Award.all
    @award = Award.new
  end

  def create
    award = Award.new(award_params)
    award.save
    redirect_to awards_path
  end

  private
    def award_params
      params.require(:award).permit(:name)
    end

    def require_admin
      render file: "/public/404" unless current_admin?
    end
end
