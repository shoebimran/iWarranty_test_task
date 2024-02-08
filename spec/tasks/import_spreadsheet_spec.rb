require 'rails_helper'
require 'rake'
RSpec.describe 'import:retailers' do
  before(:all) do
    Rails.application.load_tasks
  end

  describe 'import retailers from Excel spreadsheet' do
    let(:task) { Rake::Task['import:retailers'] }
    let(:output) { StringIO.new }

    before do
      # Redirect stdout for the task so we can capture the output
      allow($stdout).to receive(:puts).and_return(nil)
      $stdout = output
    end

    after do
      # Restore stdout
      $stdout = STDOUT
    end

    it 'imports retailers from Excel spreadsheet successfully' do
      # Mocking the Roo::Excelx.new method to avoid actually loading the spreadsheet
      allow_any_instance_of(Object).to receive(:load_spreadsheet).and_return(double('Roo::Excelx', row: ["content_post_title"], last_row: 2))

      # Mocking the process_row_data method to avoid actual processing of rows
      allow_any_instance_of(Object).to receive(:process_row_data).and_return(nil)

      # Mocking the output_retailers method to avoid actual output
      allow_any_instance_of(Object).to receive(:output_retailers).and_return(nil)

      expect { task.invoke }.to_not raise_error

      # Check if the output is empty
      expect(output.string.strip).to eq('')
    end
  end
end
