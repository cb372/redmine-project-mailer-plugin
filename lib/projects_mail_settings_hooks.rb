class ProjectMailSettingsHooks < Redmine::Hook::ViewListener
  render_on :view_projects_edit, :partial => 'projects/mail_settings_form', :multipart => true
end
