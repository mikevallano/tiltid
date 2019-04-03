class CreateTilLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :til_logs do |t|
      t.string :title
      t.text :body
      t.boolean :public, default: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
