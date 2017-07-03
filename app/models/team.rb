# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  logo       :string
#  created_at :datetime
#  updated_at :datetime
#

class Team < ActiveRecord::Base
  has_many :player_teams
  has_many :players, through: :player_teams
end
