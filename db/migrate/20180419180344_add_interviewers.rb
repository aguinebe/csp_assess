class AddInterviewers < ActiveRecord::Migration[5.1]
  def change
  	add_column :plan_capabilities, :interviewer, :string
  	add_column :plan_capabilities, :interviewee, :string
  end
end
