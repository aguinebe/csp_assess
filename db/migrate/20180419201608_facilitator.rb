class Facilitator < ActiveRecord::Migration[5.1]
  def change
  	rename_column :plan_capabilities, :interviewer, :facilitator
  	rename_column :plan_capabilities, :interviewee, :customer_name
  end
end
