class PlayersController < ApplicationController

  get "/players" do
    erb :"players/index.html"
  end

end
