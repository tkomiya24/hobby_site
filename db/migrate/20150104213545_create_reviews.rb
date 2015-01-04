class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer "reviewer_id", :null => false
    	t.integer "reviewee_id", :null => false
    	t.integer "rating", :null => false
    	t.text "review"
      	t.timestamps
    end
  end
end
