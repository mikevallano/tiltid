class CreateTidLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :tid_logs do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, foreign_key: true
      t.boolean :public, default: false

      t.timestamps
    end
  end
end
