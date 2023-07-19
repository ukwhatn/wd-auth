class CreateSystemAdminAccessLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :system_admin_access_logs do |t|
      t.references :system_admin, null: false, foreign_key: true
      t.integer :action, null: false
      t.string :ip, null: false
      t.string :user_agent, null: false
      t.timestamps
    end
  end
end
