class LicensesController < ApplicationController
  unloadable

  helper :attachments
  include AttachmentsHelper

  helper :license_versions
  include LicenseVersionsHelper

  before_filter :require_admin, :except => [:index, :show]
  before_filter :get_license_by_identifier, :except => [:index, :new, :create]


  def index
    @licenses = License.all(:order => :name)
    @settings = Setting.plugin_chiliproject_licenses
  end

  def show
    @latest_version = @license.latest_version
    redirect_to license_version_path(@license, @latest_version)
  end

  def edit
  end

  def new
    @license = License.new
    @license.versions.build
  end

  def create
    @license = License.new(params[:license])
    @license.logo_data = params[:attachments]

    if @license.save
      flash[:notice] = t(:notice_successful_create)
      redirect_to @license
    else
      render :action => :new
    end
  end

  def update
    @license.logo_data = params[:attachments]
    if @license.update_attributes(params[:license])
      flash[:notice] = t(:notice_successful_update)
      redirect_to @license
    else
      render :action => :edit
    end
  end

  def destroy
    @license.destroy
    flash[:notice] = t(:notice_successful_delete)
    redirect_to licenses_url
  end

  private

  def get_license_by_identifier
    @license = License.find_by_identifier(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
