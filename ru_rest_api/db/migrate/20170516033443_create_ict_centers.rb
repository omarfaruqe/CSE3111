class CreateIctCenters < ActiveRecord::Migration[5.1]
  def change
    create_table :ict_centers do |t|
      t.string :adminitrator
      t.string :formeradministrator
      t.string :advisory_commitee

      t.timestamps
    end
  end
end
