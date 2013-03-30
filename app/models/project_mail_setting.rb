class ProjectMailSetting < ActiveRecord::Base
  unloadable
  belongs_to :project
  validates_presence_of :project

  def self.find_by_project_id(project_id)
    ProjectMailSetting.find(:first, :conditions => ['project_id = ?', project_id])
  end

  def self.find_or_create_by_project_id(project_id)
    mail_setting = find_by_project_id(project_id)
    unless mail_setting
      mail_setting = ProjectMailSetting.new
      mail_setting.project_id = project_id
    end
    return mail_setting
  end

end
