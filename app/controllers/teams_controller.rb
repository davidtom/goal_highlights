class TeamsController < ApplicationController

  get "/teams" do
    @teams = Team.order("name ASC")
    erb :"teams/index.html"
  end

  get "/teams/new" do
    # tbd
  end

  get "/teams/:id" do
    @team = Team.find(params[:id])
    erb :"teams/show.html"
  end

end
