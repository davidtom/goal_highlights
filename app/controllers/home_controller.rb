class HomeController < ApplicationController

  get "/" do
    erb :"index.html"
  end

end
