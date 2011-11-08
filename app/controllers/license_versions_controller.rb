
class LicenseVersionsController < ApplicationController
  helper :attachments
  include AttachmentsHelper

  before_filter :require_admin, :except => :show
  before_filter :get_license_by_identifier
  before_filter :get_version_by_identifier, :only => [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def new
    @license_version = @license.versions.new
  end

  def create
    @license_version = @license.versions.new(params[:license_version])
    if @license_version.save
      flash[:notice] = t(:notice_successful_create)
      redirect_to license_version_path(:license_id => @license, :id => @license_version)
    else
      render :action => :new
    end
  end

  def update
    if @license_version.update_attributes(params[:license_version])
      flash[:notice] = t(:notice_successful_update)
      redirect_to license_version_path(:license_id => @license, :id => @license_version)
    else
      render :action => :edit
    end
  end

  def destroy
    @license_version.destroy
    flash[:notice] = t(:notice_successful_delete)
    redirect_to @license
  end

  private

  def get_license_by_identifier
    @license = License.find_by_identifier(params[:license_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def get_version_by_identifier
    @license_version = @license.versions.find_by_identifier(params[:id]) if @license
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
