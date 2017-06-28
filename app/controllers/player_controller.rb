class PlayerController < ApplicationController

  get "/players" do
    erb :"players/index"
  end

end
