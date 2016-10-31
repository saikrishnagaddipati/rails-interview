class Student < ActiveRecord::Base
  # Instance method responsible for showing student's name
  def name
    # checking duplicate firstname
    firstname_count = Student.where(firstname: firstname).count
    # we are checking conditions as per duplicate firstname 
    firstname_count > 1 ? "#{firstname} #{lastname[0]}." : "#{firstname}"
  end

  # Instance method responsible for showing student's movie
  def movie
    "#{favoritemovie}"
  end

  # method for filtering the results with movie
  def self.search_by_movie movie
    # downcase allowing to search in casesensitive
    where('lower(favoritemovie) = ?', movie.downcase)
  end

  # For fetching the proper student records
  def self.fetch_results(movie)
    movie.blank? ? self.all : self.search_by_movie(movie)
  end
end
