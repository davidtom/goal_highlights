class HighlightsController < ApplicationController

  get "/highlights" do
    @highlights = Highlight.all
    erb :"highlights/index.html"
  end

end
