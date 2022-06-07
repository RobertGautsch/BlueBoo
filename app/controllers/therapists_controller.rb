class TherapistsController < ApplicationController
  before_action :set_therapist, only: [:show, :edit, :upate]

  def index
    if params["/therapists"].present?
      # @therapists = Therapist.where("address ILIKE ?", "%#{params[:query]}%")
      # @therapists = Therapist.search_by_address(:query)
      @therapists = []
      if params["/therapists"][:query] != "" && params["/therapists"][:availability].count == 2
        availability = params["/therapists"][:availability].last
        @therapists = Therapist.where("address ILIKE ? AND available_places = ?", "%#{params["/therapists"][:query]}%", availability)
      elsif params["/therapists"][:query].present?
        @address_therapists = Therapist.where("address ILIKE ?", "%#{params["/therapists"][:query]}%")
        @therapists += @address_therapists
      elsif params["/therapists"][:availability].count == 2
        availability = params["/therapists"][:availability].last
        @available_therapists = Therapist.where(available_places: availability)
        @therapists += @available_therapists
      end
      @markers = @therapists.map do |therapist|
        {
          lat: therapist.latitude,
          lng: therapist.longitude
        }
      end
    else
      @therapists = Therapist.all
      @markers = @therapists.geocoded.map do |therapist|
        {
          lat: therapist.latitude,
          lng: therapist.longitude
        }
      end
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
