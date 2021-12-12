class EmploymentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin"

  def index
      @employments = Employment.all
  end

  def show
      @employment = JobOffer.find(params[:id])
  end

  def create
      @job_offer = JobOffer.find(params[:job_offer_id])
      # @job_offer.create_employment(params.except[:inmate_id])
      @inmate = Inmate.find(params[:employment][:inmate_id])
      # @inmate.create_employment(params.except[:inmate_id])
      # redirect_to job_offer_path(@job_offer)
      @employment = Employment.new(employment_params.merge(:job_offer_id=> params[:job_offer_id]))
      # @employment.job_offer.add(JobOffer.find(params[:job_offer_id]))
      # @employment.inmate.add(Inmate.find(employment_params[:inmate_id]))
      @job_offer.employment = @employment
      @inmate.employment = @employment
      @job_offer.save!
      @inmate.save!
      @employment.save!
      redirect_to job_offer_path(@job_offer)
  end
  
  def destroy
      @job_offer = JobOffer.find(params[:job_offer_id])
      @inmate = Inmate.find(employment_params[:inmate_id])
      @employment = @job_offer.job_offers.find(params[:id])
      @employment.destroy
      @employment = @inmate.job_offers.find(params[:id])
      @employment.destroy
      redirect_to job_offers_path
  end

  private
      def employment_params
          params.require(:employment).permit(:inmate_id, :start_date)
      end
end
