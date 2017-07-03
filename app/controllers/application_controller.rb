class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  set :views, "./app/views"
  set :public_dir, "public"

end
