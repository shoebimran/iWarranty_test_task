# spec/tasks/update_search_index_spec.rb
require 'rails_helper'
require 'rake'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'search:update_index' do
  before(:all) do
    Rails.application.load_tasks
    Rake::Task.define_task(:environment)
  end

  describe 'search:update_index' do
    it 'updates the search index successfully' do
      # Mocking Retailer.all to return some sample data
      allow(Retailer).to receive(:all).and_return([
                                                    double('Retailer',
                                                           content_post_title: 'Sample Title',
                                                           content_body: 'Sample Content',
                                                           directory_category: 'Sample Category',
                                                           directory_contact__email: 'sample@example.com',
                                                           directory_contact__fax: '123456789',
                                                           directory_contact__mobile: '987654321',
                                                           directory_contact__phone: '9876543210',
                                                           directory_contact__website: 'http://www.example.com',
                                                           directory_location__street: 'Sample Street',
                                                           directory_location__city: 'Sample City',
                                                           directory_location__country: 'Sample Country',
                                                           directory_location__address: 'Sample Address',
                                                           directory_location__lat: '123.456',
                                                           directory_location__lng: '78.90',
                                                           directory_location__zip: '12345',
                                                           directory_location__state: 'Sample State',
                                                           directory_social__facebook: 'sample_facebook',
                                                           directory_social__googleplus: 'sample_googleplus',
                                                           directory_social__twitter: 'sample_twitter',
                                                           content_post_status: 'Sample Status')
                                                  ])

      # Expectations to ensure correct output
      expect { Rake::Task['search:update_index'].invoke }.to output(/Search index updated successfully/).to_stdout
    end
  end
end
# rubocop:enable Metrics/BlockLength
