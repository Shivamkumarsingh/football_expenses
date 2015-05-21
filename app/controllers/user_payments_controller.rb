class UserPaymentsController < ApplicationController
  before_action :set_user
  before_action :set_user_payment, only: [:show, :edit, :update, :destroy]

  # GET /user_payments
  # GET /user_payments.json
  def index
    @user_payments = @user.user_payments
  end

  # GET /user_payments/1
  # GET /user_payments/1.json
  def show
  end

  # GET /user_payments/new
  def new
    @user_payment = @user.user_payments.build
  end

  # GET /user_payments/1/edit
  def edit
  end

  # POST /user_payments
  # POST /user_payments.json
  def create
    @user_payment = @user.user_payments.build(user_payment_params)

    respond_to do |format|
      if @user_payment.save
        format.html { redirect_to user_user_payments_path(@user), notice: 'User payment was successfully created.' }
        format.json { render :show, status: :created, location: @user_payment }
      else
        format.html { render :new }
        format.json { render json: @user_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_payments/1
  # PATCH/PUT /user_payments/1.json
  def update
    respond_to do |format|
      if @user_payment.update(user_payment_params)
        format.html { redirect_to user_user_payments_path(@user), notice: 'User payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_payment }
      else
        format.html { render :edit }
        format.json { render json: @user_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_payments/1
  # DELETE /user_payments/1.json
  def destroy
    @user_payment.destroy
    respond_to do |format|
      format.html { redirect_to user_user_payments_path(@user), notice: 'User payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user_payment
      @user_payment = @user.user_payments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_payment_params
      params.require(:user_payment).permit(:amount)
    end
end
