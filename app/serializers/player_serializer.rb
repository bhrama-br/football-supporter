# == Schema Information
#
# Table name: players
#
#  id          :bigint           not null, primary key
#  birth_date  :date
#  name        :string           not null
#  nationality :string
#  number      :integer
#  position    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_id     :bigint
#
# Indexes
#
#  index_players_on_team_id  (team_id)
#
class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :number, :nationality, :birth_date, :age, :position, :team, :notifications, :subscriber

  def initialize(object, options = {})
    super
    @current_user = options[:current_user] || nil
  end

  def age
    object.age
  end

  def team
    object.team.name
  end

  def notifications
    object.notifications.order(created_at: :desc)
  end

  def subscriber
    @current_user.present? ? object.player_subscriptions.exists?(user_id: @current_user.id) : nil
  end
end
