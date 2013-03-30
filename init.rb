# Project-specific mail settings plugin for Redmine
#
require 'redmine'
require 'projects_mail_settings_hooks'
require 'project_mail_settings_mailer_patch'
require 'mail_settings_project_settings_patch'

Rails.configuration.to_prepare do
  puts "Rails.configuration.to_prepare"

  # Guards against including the module multiple time (like in tests)
  # and registering multiple callbacks
  unless Project.included_modules.include? MailSettingsProjectSettingsPatch
    Project.send(:include, MailSettingsProjectSettingsPatch)
  end 
  unless Mailer.included_modules.include? ProjectMailSettingsMailerPatch
    Mailer.send(:include, ProjectMailSettingsMailerPatch)
  end 
end

Redmine::Plugin.register :redmine_project_mailer do
  name 'Redmine Project-specific mail address plugin'
  author 'Chris Birchall'
  description 'Lets you specify a different mail From: address per project for notification mails'
  version '0.0.1'
  url 'https://github.com/cb372/redmine-project-mailer-plugin'
  author_url 'http://twitter.com/cbirchall'
  requires_redmine :version_or_higher => '2.2.0'
end
