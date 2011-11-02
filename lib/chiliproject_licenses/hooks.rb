module ChiliprojectLicenses
  class Hooks < Redmine::Hook::ViewListener
    # :project
    # :form
    render_on :view_projects_show_right, :partial => 'projects/license'
  end
end
