class CreateImportantDateApis < ActiveRecord::Migration[5.1]
  def change
    create_table :important_date_apis do |t|
      t.string :Description

      t.timestamps
    end
  end
end
