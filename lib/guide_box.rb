require 'json'
require 'http'


class GuideBox
    @key = nil
    @base_url = nil
    
    def initialize
        @key = '17001bea4973d9dc3a13042a2c9063a1a206712b'
        @base_url = 'http://api-public.guidebox.com/v2'
    end 
    
    def get_movies()
        puts "#{@base_url}/movies?sources=netflix&limit=250&api_key=#{@key}"
        response = HTTP.get("#{@base_url}/movies?sources=netflix&limit=250&api_key=#{@key}").body
        movies = JSON.parse(response)['results']
        filtered_movies = movies.select{ |movie| movie['title'].downcase.include?('a') }
        filtered_movies
    end 
end 