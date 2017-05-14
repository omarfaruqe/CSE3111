class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.string :exam_id
      t.string :time
      t.string :date
      t.string :length

      t.timestamps
    end
  end
end
