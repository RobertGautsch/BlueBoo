class ResourcesController < ApplicationController
  def index
    @resources = Resources.all
  end

  def show
    @resource = Resources.find(params[:id])
  end
end
