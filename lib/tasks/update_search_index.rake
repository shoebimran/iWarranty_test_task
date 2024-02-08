# lib/tasks/update_search_index.rake
# rubocop:disable Metrics/BlockLength
namespace :search do
  desc "Update search index"
  task update_index: :environment do
    # Call your application logic to generate JSON index entries
    index_entries = generate_index_entries

    # Output JSON index entries to the console
    index_entries.each do |entry|
      puts entry.to_json
    end
    puts "Search index updated successfully"
  end

  # Define a method to generate index entries
  # rubocop:disable Metrics/MethodLength
  def generate_index_entries
    # Fetch data from the Retailers model and format it into JSON index entries
    Retailer.all.map do |retailer|
      {
        title: retailer.content_post_title,
        content: retailer.content_body,
        category: retailer.directory_category,
        contact: {
          email: retailer.directory_contact__email,
          fax: retailer.directory_contact__fax,
          mobile: retailer.directory_contact__mobile,
          phone: retailer.directory_contact__phone,
          website: retailer.directory_contact__website
        },
        location: {
          street: retailer.directory_location__street,
          city: retailer.directory_location__city,
          country: retailer.directory_location__country,
          address: retailer.directory_location__address,
          lat: retailer.directory_location__lat,
          lng: retailer.directory_location__lng,
          zip: retailer.directory_location__zip,
          state: retailer.directory_location__state
        },
        social: {
          facebook: retailer.directory_social__facebook,
          googleplus: retailer.directory_social__googleplus,
          twitter: retailer.directory_social__twitter
        },
        status: retailer.content_post_status
      }
    end
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/BlockLength
