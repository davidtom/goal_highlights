class TeamsController < ApplicationController

  get "/players" do
    erb :"players/index.html"
  end

end
