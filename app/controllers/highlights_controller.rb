class HighlightsController < ApplicationController

  get "/highlights" do
    @highlights = Highlight.all_group_and_order_by_date
    erb :"highlights/index.html"
  end

end
