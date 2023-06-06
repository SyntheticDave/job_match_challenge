class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @skills = Skill.all
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      CalculateJobMatchingPercentagesWorker.perform_async(@job.id)
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
    @skills = Skill.all
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      CalculateJobMatchingPercentagesWorker.perform_async(@job.id)
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, skill_ids: [])
  end
end
