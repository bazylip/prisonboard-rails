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
      @inmate = Inmate.find(params[:employment][:inmate_id])
      if @job_offer.employment.nil? && @inmate.employment.nil?
        @employment = Employment.new(employment_params.merge(:job_offer_id=> params[:job_offer_id]))
        @job_offer.employment = @employment
        @inmate.employment = @employment
        @job_offer.save!
        @inmate.save!
        @employment.save!
        redirect_to job_offer_path(@job_offer)
      else
        redirect_to job_offer_path(@job_offer)
      end
  end
  
  def destroy
        @employment = Employment.find(params[:job_offer_id])
        @job_offer = JobOffer.find(@employment.job_offer_id)
        @inmate = Inmate.find(@employment.inmate_id)
        @job_offer.employment = nil
        @inmate.employment = nil
        @job_offer.save!
        @inmate.save!
      @employment.destroy
      redirect_to job_offer_path(@job_offer)
  end

  private
      def employment_params
          params.require(:employment).permit(:inmate_id, :start_date)
      end
end
