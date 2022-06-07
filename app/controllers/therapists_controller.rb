class TherapistsController < ApplicationController
  before_action :set_therapist, only: [:show, :edit, :upate]

  def index

    if params[:query].present?
      @therapists = Therapist.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @therapists = Therapist.all
    end

    @markers = @therapists.geocoded.map do |therapist|
      {
        lat: therapist.latitude,
        lng: therapist.longitude
      }

    end
  end

  def show
  end

  def new
    @therapist = Therapist.new
  end

  def create
    @therapist = Therapist.new(therapist_params)
    if @therapist.save
      redirect_to therapist_path(@therapist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @therapist.update(therapist_params)
    redirect_to therapist_path(@therapist)
  end

  private

  def set_therapist
    @therapist = Therapist.find(params[:id])
  end

  def therapist_params
    params.require(:therapist).permit(:first_name, :last_name, :address, :individual_therapy, :group_therapy, :available_places, :waiting_time, :telephone_number)
  end
end
