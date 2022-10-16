# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  player_id  :bigint
#
# Indexes
#
#  index_notifications_on_player_id  (player_id)
#
require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
