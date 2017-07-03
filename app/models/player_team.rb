# == Schema Information
#
# Table name: player_teams
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  team_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class PlayerTeam < ActiveRecord::Base
  belongs_to :player
  belongs_to :team
end
