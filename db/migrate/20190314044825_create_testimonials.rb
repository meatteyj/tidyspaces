class CreateTestimonials < ActiveRecord::Migration[5.2]
  def change
    create_table :testimonials do |t|
      t.text :content
      t.string :user_id

      t.timestamps
    end
  end
end
