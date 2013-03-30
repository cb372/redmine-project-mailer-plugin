class CreateProjectMailSettings < ActiveRecord::Migration
  def self.up
    create_table :project_mail_settings do |t|

      t.column :project_id, :integer

      t.column :mail_from, :string

      t.column :updated_at, :timestamp

    end
  end

  def self.down
    drop_table :project_mail_settings
  end
end
