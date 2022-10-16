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
class Player < ApplicationRecord
  paginates_per 12
  
  has_many :notifications, dependent: :destroy
  has_many :player_subscriptions, dependent: :destroy
  
  belongs_to :team

  def age
    age = Date.today.year - birth_date.year
    age -= 1 if Date.today < birth_date + age.years
    age
  end

  def self.subscribers(current_user)
    self.joins(:player_subscriptions).where('player_subscriptions.user_id = ?', current_user.id)
  end
end
