class HighlightsController < ApplicationController

  get "/highlights" do
    @highlights = Highlight.all_group_and_order_by_date
    erb :"highlights/index.html"
  end

  get "/highlights/new" do
    #TBD
  end

  get "/highlights/:id" do
    @highlight = Highlight.find(params[:id])
    erb :"/highlights/show.html"
  end

end
