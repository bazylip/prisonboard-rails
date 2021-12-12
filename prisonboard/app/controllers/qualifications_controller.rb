class QualificationsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin"

  def create
      @inmate = Inmate.find(params[:inmate_id])
      @qualification = @inmate.qualifications.create(qualification_params)
      redirect_to inmate_path(@inmate)
  end
  
  def destroy
      @inmate = Inmate.find(params[:inmate_id])
      @qualification = @inmate.qualifications.find(params[:id])
      @qualification.destroy
      redirect_to inmate_path(@inmate)
  end

  private
      def qualification_params
          params.require(:qualification).permit(:skill, :level)
      end
end
