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
require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
