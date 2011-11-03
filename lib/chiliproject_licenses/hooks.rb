module ChiliprojectLicenses
  class Hooks < Redmine::Hook::ViewListener
    # :project
    # :form
    render_on :view_projects_show_right, :partial => 'projects/license'
    render_on :view_projects_form, :partial => 'projects/license_fields'
  end
end
