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

  def find_all_movies_by_pixar
  #get movies that are made by pixar
  @pixar_movies = []
  @pixar_movies = @movies.select {|x| x.studio == Studio::Pixar}

  end

  def count
    @movies.size
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
