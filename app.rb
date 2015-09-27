# App that show the use of flash. When redirecting the vari# able time is lost if flash is not used
require 'sinatra'
require 'slim'
require 'sinatra/flash'
require 'sinatra/reloader' if development?


enable :sessions

get '/' do

  slim :index

end

post "/time" do
  flash[:time] = Time.now.strftime("%I:%M:%S")
  # @time = Time.now ... wont work, get lost.
  redirect '/'
end

__END__

@@layout
doctype html
html
  head
  meta charset="utf-8"
body
  == yield

@@index
h1 Sinatra Flash la cuca
form action="/time" method="POST"
  input type="submit" value="What time is it?" title="what time is it?"
p The time is #{flash[:time]} 
