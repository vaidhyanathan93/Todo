class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string    :todo
      t.date      :date
      t.column    :creator_id, 'BIGINT UNSIGNED'
      t.boolean   :is_completed, null: false, default: 0
      t.boolean   :is_deleted, null: false, default: 0
      t.timestamps
    end
  end
end
