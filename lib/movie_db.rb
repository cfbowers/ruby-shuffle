require 'themoviedb'

class Mdb 
    # Init with cfb's movie db key 
    Tmdb::Api.key("2b5587ef1330e9d80405c7f1e5c3da96")

    def genres 
        genres = Tmdb::Genre.list["genres"]
        genres.map { |genre| { name: genre["name"], tmdb_id: genre["id"] } }
    end 
end 