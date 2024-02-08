require 'roo'
# rubocop:disable Metrics/BlockLength
namespace :import do
  desc "Import retailers from Excel spreadsheet"
  task retailers: :environment do
    file_path = ENV['FILE_PATH']
    if file_path.nil? || file_path.empty?
      puts "Error: Please provide the path to the Excel spreadsheet."
      next
    end
    import_retailers(file_path)
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
    puts e.backtrace.join("\n")
  end

  def import_retailers(file_path)
    retailers = []
    spreadsheet = load_spreadsheet(file_path)
    headers = spreadsheet.row(1)
    process_spreadsheet_rows(spreadsheet, headers, retailers)
    output_retailers(retailers)
  end

  def load_spreadsheet(file_path)
    Roo::Excelx.new(file_path)
  end

  def process_spreadsheet_rows(spreadsheet, headers, retailers)
    (2..spreadsheet.last_row).each do |i|
      row_data = spreadsheet.row(i)
      process_row_data(row_data, headers, retailers, i)
    end
  end

  def process_row_data(row_data, headers, retailers, _row_index)
    return unless row_data.is_a?(Array)

    row = Hash[headers.zip(row_data)]
    retailer = Retailer.find_or_initialize_by(content_post_title: row["content_post_title"])

    if retailer.new_record?
      retailer.update(row)
      retailers << construct_retailer_json(row)
      # Return the constructed JSON data
      construct_retailer_json(row)
    else
      puts "Retailer #{row['content_post_title']} already exists, skipping."
      # If the retailer already exists, return nil
      nil
    end
  end

  def construct_retailer_json(row)
    {
      "name" => row["content_post_title"],
      "address" => extract_keys(row, "directory_location__", %w[street city state country zip]),
      "contact" => extract_keys(row, "directory_contact__", %w[email phone website]),
      "social_media" => extract_keys(row, "directory_social__", %w[facebook twitter googleplus]),
      "product_count" => 0  
    }
  end

  def extract_keys(row, prefix, keys)
    keys.map { |key| [key, row["#{prefix}#{key}"]] }.to_h
  end

  def output_retailers(retailers)
    puts retailers.to_json
  end
end
# rubocop:enable Metrics/BlockLength
