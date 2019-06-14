class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string    :todo
      t.date      :date
      t.column    :creator_id, 'BIGINT UNSIGNED'
      t.integer   :status, limit: 2,null: false, default: 0# 0 - open , 1 - complete, 2- active
      t.boolean   :is_deleted, null: false, default: 0
      t.timestamps
    end
  end
end
