class Notify < ApplicationMailer

  def notify_user(user)
    @user = user
    mail(to: user.email, subject: 'Josh Football Outstanding Amount')
  end
end
