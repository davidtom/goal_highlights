class TeamsController < ApplicationController

  get "/teams" do
    erb :"teams/index.html"
  end

end
