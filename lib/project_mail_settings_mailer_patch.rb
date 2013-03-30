#require_dependency 'application_controller'

module ProjectMailSettingsMailerPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :mail, :project_mail_settings_check
    end
  end
 
  module InstanceMethods

    def mail_with_project_mail_settings_check(headers)
      mail_without_project_mail_settings_check
        
      if headers['X-Redmine-Project']
        puts "X-Redmine-Project = #{headers['X-Redmine-Project']}"
      end
    end    

  end

end
