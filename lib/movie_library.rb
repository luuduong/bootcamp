require 'helpers'

class MovieLibrary
  include Helpers

  def initialize(movies = [])
    @movies = movies
  end

  def add(movie)
    @movies.push(movie) unless include?(movie)
  end

  def include?(movie)
    find {|x| x.title == movie.title}
  end

  def find(&block)
    @movies.each do |movie|
      result = block.call(movie)
      if result
        return true
      end
    end
    return nil
  end

  def total_count
    @movies.size
  end

  def count
    @movies.size
  end

  def find_all_movies_by_pixar
    @pixar_movies = []
    @pixar_movies = @movies.find_all {|x| x.studio == Studio::Pixar}
    #puts "pixar movies are..."
    #@pixar_movies.each{|x| puts x.title}
  end

   def find_all_movies_by_pixar_or_disney
    @pixar_disney_movies = []
    @pixar_disney_movies = @movies.find_all {|x| (x.studio == Studio::Pixar || x.studio == Studio::Disney)}
    #puts "pixar and disney movies are..."
    #@pixar_movies.each{|x| puts x.title}
  end

   def find_all_movies_not_published_by_pixar
    #get movies that are made by pixar
    @not_pixar_movies = []
    @not_pixar_movies = @movies.find_all {|x| x.studio != Studio::Pixar}
    #puts "pixar and disney movies are..."
    #@pixar_movies.each{|x| puts x.title}
  end

  def find_all_movies_published_after_2004
    @after_2004_movies = @movies.find_all {|x| x.year_published > 2004}
  end 


  def find_all_movies_between_1982_and_2003
    @from_1982_to_2003_movies = @movies.find_all {|x| (x.year_published >= 1982 && x.year_published <= 2003)}
  end

  def sort_movies_by_title_descending
    @sorted_movies_by_title = @movies.sort_by {|x| x.title}
  end

  def sort_movies_by_title_ascending
    @sorted_movies_by_title_asc = @movies.sort{|a,b| b.title <=> a.title}
  end

  def sort_movies_by_descending_release_date
    @sorted_movies_by_date_des = @movies.sort{|a,b| b.year_published <=> a.year_published}
  end

  def sort_movies_by_ascending_release_date
    @sorted_movies_by_date_asc = @movies.sort{|a,b| a.year_published <=> b.year_published  }
  end

  def sort_movies_by_preferred_studios_and_release_date_ascending
    @rankings = [Studio::Pixar, Studio::Disney, Studio::CastleRock, Studio::MiramaxFilms, Studio::RegencyEnterprises]

    #sort list of movies first by array index then right after sort by publish date
    @sorted_by_studio = @movies.sort do |a,b| 
      result = @rankings.find_index(a.studio) <=> @rankings.find_index(b.studio)
      p result
      if result == 0 
        a.year_published <=> b.year_published
      else
         result
      end
    end

    #@sorted_by_date =  @sorted_by_studio.sort {|a,b| a.year_published <=> b.year_published}

  end 
  

  def each
    # @movies.count.times do |n|
    #   yield @movies[n]
    # end

    # n = 0
    # loop do
    #   current = @movies[n]
    #   puts current
    #   return unless current
    #   yield current
    #   n += 1
    # end

    # for x in @movies
    #   yield x
    # end

    # i = 0
    # current = @movies[i]
    # while current do
    #   yield current
    #   current = @movies[i]
    #   i+=1
    # end

    # i = 0
    #   until i == @movies.count do
    #     yield @movies[i]
    #     i +=1
    #   end
    #       
    #i =0
    #yield @movies[i]; i+=1 until @movies.count==i
    #      

    # puts "blah" while true
    @movies.each do |movie|
      yield movie
    end
  end
end
