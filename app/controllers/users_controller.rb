class UsersController < ApplicationController
  before_action :set_user, only: [:games, :pay]

  def index
    @users = User.all
  end

  def games
    @payments = @user.payments
  end

  def pay

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
