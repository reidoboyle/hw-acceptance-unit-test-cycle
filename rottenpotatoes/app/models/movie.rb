class Movie < ActiveRecord::Base
    def self.find_directors(movie_director)
       where(["director = ?",movie_director]) 
    end
end
