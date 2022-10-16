class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :subscriptions

  def subscriptions
    Player.where(id: object.player_subscriptions.players.pluck(:player_id))
  end
end
