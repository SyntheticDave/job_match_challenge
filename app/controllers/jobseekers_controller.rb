class JobseekersController < ApplicationController
  def index
    @jobseekers = Jobseeker.all
  end

  def show
    @jobseeker = Jobseeker.find(params[:id])
  end
end
