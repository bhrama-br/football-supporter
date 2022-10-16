class UsersSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :subscriptions_count

  def subscriptions_count
    object.player_subscriptions.count
  end
end
