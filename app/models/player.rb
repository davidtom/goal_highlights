# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Player < ActiveRecord::Base
  has_many :highlights
  has_many :player_teams
  has_many :teams, through: :player_teams

end
