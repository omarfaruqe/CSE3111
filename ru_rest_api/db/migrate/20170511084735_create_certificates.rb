class CreateCertificates < ActiveRecord::Migration[5.1]
  def change
    create_table :certificates do |t|
      t.string :name
      t.string :shift
      t.string :duration
      t.string :requirement

      t.timestamps
    end
  end
end
