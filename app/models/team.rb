# == Schema Information
#
# Table name: teams
#
#  id           :integer          not null, primary key
#  name         :string
#  logo         :string
#  created_at   :datetime
#  updated_at   :datetime
#  team_url     :string
#  fixtures_url :string
#  players_url  :string
#  shortname    :string
#  code         :string
#

class Team < ActiveRecord::Base
  has_many :player_teams
  has_many :players, through: :player_teams

  validates :name, uniqueness: true
  validates :shortname, uniqueness: true

  def self.create_assignment_hash(data)
    {
      name: data["name"],
      logo: data["crestUrl"],
      team_url: data["_links"]["self"]["href"],
      fixtures_url: data["_links"]["fixtures"]["href"],
      players_url: data["_links"]["players"]["href"],
      shortname: data["shortName"],
      code: data["code"],
    }
  end

end
