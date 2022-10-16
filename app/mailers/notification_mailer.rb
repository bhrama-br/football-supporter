class NotificationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def notification
    @player = Player.find(params[:player_id])

    @user = User.find(params[:user_id])
    mail(to: @user.email, subject: 'New Notification Player')
  end
end
