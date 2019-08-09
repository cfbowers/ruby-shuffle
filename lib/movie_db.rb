require 'themoviedb'
require 'http'
require 'json'
require 'zlib'
require 'open-uri'
# https://github.com/httprb/http




class Mdb
    def initialize
        #cfb's key
        @key = '2b5587ef1330e9d80405c7f1e5c3da96'
        @base_url = 'https://api.themoviedb.org/3'
        Tmdb::Api.key(@key)
    end

    def genres
        genres = Tmdb::Genre.list["genres"]
        genres.map { |genre| { name: genre["name"], tmdb_id: genre["id"] } }
    end

    def query_movies(filters)
        url = "#{@base_url}/discover/movie?api_key=#{@key}"

        url << "&release_date.gte=#{filters[:year_start]}"  if value_exists(filters, :year_start)
        url << "&release_date.lte=#{filters[:year_end]}"    if value_exists(filters, :year_end)
        url << "&with_genres=#{filters[:genres].join(',')}" if value_exists(filters, :genres)

        JSON.parse( HTTP.get(url) )
    end

    def keywords
        mm_dd_yyy = DateTime.now.strftime('%m_%d_%Y')
        url = "http://files.tmdb.org/p/exports/keyword_ids_#{mm_dd_yyy}.json.gz"
        gz = Zlib::GzipReader.new(open(url))
        gz.read.split("\n").map do |object|
            json = JSON.parse(object)
            { tmdb_id: json['id'], name: json['name'] }
        end
    end

    private
    # There is probably a better way of doing this
    # Return false if the key does not exist in the object, false if it's an empty string, false if it's an int less than 0
    def value_exists(object, key)
        if (object.has_key?(key))
            value = object[key]
            (value.class == Fixnum) ? (value > 0) : (!value.empty?)
        else
            false
        end
    end

end

# This is just to test the file by calling it directly (e.g 'ruby movie_db.rb')
# mdb = Mdb.new
# puts mdb.keywords.count
# puts mdb.query_movies({ year_start: '1990', year_end: '1991', genres: [12, 53, '28', 878] })
