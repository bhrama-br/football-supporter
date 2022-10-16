# == Schema Information
#
# Table name: player_subscriptions
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  player_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_player_subscriptions_on_player_id  (player_id)
#  index_player_subscriptions_on_user_id    (user_id)
#
class PlayerSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :player

  before_validation :validate_exists

  private

  def validate_exists
    if PlayerSubscription.exists?(user_id: self.user_id, player_id: self.player_id)
      errors.add(:subscription, "User is already subscribed")
      false
    end
  end
end
