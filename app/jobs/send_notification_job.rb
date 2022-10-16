class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(notification)
    notification.player.player_subscriptions.each do |ps|
      NotificationMailer.with(user_id: ps.user.id, player_id: ps.player_id, notification_id: notification.id).notification.deliver_later
    end
    #

    # Do something later
  end
end
