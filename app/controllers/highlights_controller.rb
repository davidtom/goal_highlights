class HighlightsController < ApplicationController

  get "/highlights" do
    erb :"highlights/index.html"
  end

end
