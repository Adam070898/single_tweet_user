get '/' do
  erb :index
end

get '/tweet' do
  erb :tweet
end

post '/tweet' do
  tweet = params[:tweet]
  $client.update(tweet)
end