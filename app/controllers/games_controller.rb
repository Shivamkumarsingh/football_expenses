class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all.order('date desc')
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.where(id: params[:id]).includes(payments: [:user]).first
  end

  # GET /games/new
  def new
    @game = Game.new
    @users = User.where(status: true)
  end

  # GET /games/1/edit
  def edit
    @users = User.where(status: true)
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @game.payments_attributes = build_payments_params(@game, game_params[:amount])

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    @game.payments_attributes = build_payments_params(@game, game_params[:amount])

    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.where(editable: true, id: params[:id]).first

    unless @game
      redirect_to games_url, notice: 'Action not allowed.'
      return false
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    @game_params ||= params.require(:game).permit(:amount, :date, :goals, payments_attributes: []).tap do |fields|
      fields[:date] = Date.strptime(fields[:date], '%d/%m/%Y') if fields[:date].present?
    end
  end

  def build_payments_params(game, amount)
    per_persion = (amount.to_f / params[:users].count{|k,v| v == 'true'}).ceil

    payments = game.payments.to_a

    params[:users].map do |id, v|
      if game
        payment_id = payments.find{|v| v.user_id == id.to_i }.try(:id)
      else
        payment_id = nil
      end

      {
        user_id: id,
        amount: per_persion
      }.tap do |f|
        f[:id] = payment_id if payment_id
        f[:_destroy] = '1' if v == 'false'
      end
    end
  end
end
