class AddColumnsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :team_url, :string
    add_column :teams, :fixtures_url, :string
    add_column :teams, :players_url, :string
    add_column :teams, :shortname, :string
    add_column :teams, :code, :string
  end
end
