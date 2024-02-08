class CreateRetailers < ActiveRecord::Migration[7.0]
  def change
    create_table :retailers do |t|
      t.string :directory_category
      t.integer :content_children_count
      t.string :directory_contact__email
      t.string :directory_contact__fax
      t.string :directory_contact__mobile
      t.string :directory_contact__phone
      t.string :directory_contact__website
      t.integer :content_post_id
      t.string :content_post_slug
      t.text :content_body
      t.string :directory_location__street
      t.string :directory_location__city
      t.string :directory_location__country
      t.string :directory_location__address
      t.float :directory_location__lat
      t.float :directory_location__lng
      t.string :directory_location__zip
      t.string :directory_location__state
      t.string :directory_social__facebook
      t.string :directory_social__googleplus
      t.string :directory_social__twitter
      t.string :content_post_status
      t.string :content_post_title

      t.timestamps
    end
  end
end
