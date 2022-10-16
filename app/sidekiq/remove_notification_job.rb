class RemoveNotificationJob
  include Sidekiq::Job
  # RUN JOB ALL DAY IN 23:00:00
  def perform()
    puts 'Remove Notifications'
    @days_old = 7 #qtd days old for remove

    @date = DateTime.now - @days_old.days
    @notification = Notification.where("created_at <= ?", @date.end_of_day)
    @notification.destroy_all

    puts 'End Remove Notifications'

  end
end
