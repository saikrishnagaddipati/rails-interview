class StudentsController < ApplicationController

	# Method for listing all the students
    def index
    	# It will list all the students 
    	# It will filter the results as well if there is movie parameter
    	@students = Student.fetch_results(params[:movie])
    end

end
