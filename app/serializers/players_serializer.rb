class PlayersSerializer < ActiveModel::Serializer
  attributes :id, :name, :number, :nationality, :birth_date, :age, :position, :team, :subscriber, :notifications_count

  def initialize(object, options = {})
    super
    @current_user = options[:current_user] || nil
  end

  def team
    object.team.name
  end

  def age
    object.age
  end

  def subscriber
    @current_user.present? ? object.player_subscriptions.exists?(user_id: @current_user.id) : nil
  end

  def notifications_count
    object.notifications.count
  end
end
