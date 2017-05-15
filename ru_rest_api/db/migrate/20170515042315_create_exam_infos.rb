class CreateExamInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_infos do |t|
      t.string :exam_date
      t.string :time_duration
      t.string :exam_time
      t.string :Exam_roll

      t.timestamps
    end
  end
end
