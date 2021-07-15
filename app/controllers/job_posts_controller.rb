class JobPostsController < ApplicationController
    def new
        @job_post = JobPost.new
    end

    def create
        @job_post = JobPost.create params.require(:job_post)
            .permit(
                :title,
                :description,
                :location,
                :min_salary,
                :max_salary,
                :company_name
            )
        redirect_to job_post_path(@job_post)
    end
end
