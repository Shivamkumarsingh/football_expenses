class UsersController < ApplicationController
  before_action :set_user, only: [:games, :pay]

  def index
    # sort users according to their outstanding amount
    @users = User.all.sort{|a,b| a.outstanding_amount <=> b.outstanding_amount}.reverse
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def games
    @payments = Payment.where(user_id: @user.id).includes(:game).order('games.date desc')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
