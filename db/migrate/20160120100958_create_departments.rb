class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :title
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
