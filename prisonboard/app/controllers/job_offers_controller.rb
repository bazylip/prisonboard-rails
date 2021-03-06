class JobOffersController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "admin"

    def index
        @job_offers = JobOffer.all

        if params[:job_title] && params[:job_title] != ""
            @job_offers = @job_offers.where("job_title like ?", 
            "%#{params[:job_title]}%")
        end
    

        if params[:company] && params[:company] != ""
            @job_offers = JobOffer.joins(:company).where("companies.full_name like ?", 
            "%#{params[:company]}%")
        end
    end

    def show
        @job_offer = JobOffer.find(params[:id])
    end

    def create
        @company = Company.find(params[:company_id])
        @job_offer = @company.job_offers.create(job_offer_params)
        redirect_to company_path(@company)
    end
    
    def destroy
        @company = Company.find(params[:company_id])
        @job_offer = @company.job_offers.find(params[:id])
        @job_offer.destroy
        redirect_to company_path(@company)
    end

    private
        def job_offer_params
            params.require(:job_offer).permit(:job_title, :hourly_rate, :weekly_hours)
        end

end
