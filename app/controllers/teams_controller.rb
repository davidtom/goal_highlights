class TeamsController < ApplicationController

  get "/teams" do
    @teams = Team.order("name ASC")
    erb :"teams/index.html"
  end

end
