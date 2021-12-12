class JobOffersController < ApplicationController

    def create
        @company = Company.find(params[:company_id])
        @job_offer = @company.job_offers.create(job_offer_params)
        redirect_to company_path(@company)
    end

    private
        def job_offer_params
            params.require(:job_offer).permit(:job_title, :hourly_rate, :weekly_hours)
        end

end
