require 'json'
require 'http'

key = '17001bea4973d9dc3a13042a2c9063a1a206712b'
base_url = 'http://api-public.guidebox.com/v2'

response = HTTP.get("#{base_url}/movies?sources=netflix&limit=250&api_key=#{key}").body
movies = JSON.parse(response)['results']

filtered_movies = movies.select{ |movie| movie['title'].downcase.include?('a') }

puts JSON.pretty_generate(filtered_movies)

# puts JSON.pretty_generate(movies['results'][1])