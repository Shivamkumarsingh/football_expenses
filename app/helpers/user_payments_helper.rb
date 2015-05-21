module UserPaymentsHelper

  def form_url
    if @user_payment.new_record?
      user_user_payments_path(@user)
    else
      user_user_payment_path(@user, @user_payment)
    end
  end

end
