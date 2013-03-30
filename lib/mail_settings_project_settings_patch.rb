module MailSettingsProjectSettingsPatch
  def self.included(base) # :nodoc:
    base.send(:include, ProjectSettingsInstanceMethodsForMailSettings)

    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
     
    end

  end
end

module ProjectSettingsInstanceMethodsForMailSettings
  
  def mail_from
    mail_setting = ProjectMailSetting.find_by_project_id(project.id)
    return nil unless mail_setting
    mail_setting.mail_from
  end

  def mail_from=(address)
    mail_setting = ProjectMailSetting.find_or_create_by_project_id(project.id)
    mail_setting.mail_from = address
    mail_setting.save!
  end
end
