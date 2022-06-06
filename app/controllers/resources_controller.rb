class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.find(params[:id])
  end
end
