class SubjectsController < ApplicationController
	def show
		profile = Profile.find(params[:profile_id])
		subject = profile.subjects.find(params[:subject_id])
		
		render json: subject
	end
end