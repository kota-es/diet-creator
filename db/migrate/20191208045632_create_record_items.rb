class CreateRecordItems < ActiveRecord::Migration[5.2]
  def change
    create_table :record_items do |t|
      t.references :record, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
