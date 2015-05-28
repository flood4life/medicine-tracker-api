class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.references :schedule, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
