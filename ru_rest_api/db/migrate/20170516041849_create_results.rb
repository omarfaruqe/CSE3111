class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.string :exam_roll
      t.string :subject_code
      t.string :subject_result

      t.timestamps
    end
  end
end
