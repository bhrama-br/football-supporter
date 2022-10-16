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
require "test_helper"

class PlayerSubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
