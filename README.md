
### Customer Spreadsheet Parser 
This command-line application is designed to parse a customer spreadsheet and generate a stream of JSON lines suitable for indexing in a search engine. The primary goal is to extract the list of retailers from the spreadsheet, perform necessary error checks and rectifications, and group items to enhance the customer user interface experience.

The output of this application is a series of JSON lines, each representing a single index entry. You can customize the schema according to your preferred search experience. The generated JSON lines are intended to be piped into another command-line application responsible for updating the search index. Please note that the specifics of the search engine used, which is a cloud-based service, are beyond the scope of this assignment.

This readme provides an overview of the task and guides you through using the application effectively. Let's get started!


## Retailers Importer
This Rails application includes functionality to import retailers from a file into the database and update the search index based on the imported data.

### Setup
**Clone the repository:**  

`git clone https://github.com/shoebimran/iWarranty_test_task.git`  

**Install dependencies:**    

`bundle install`  

**Database setup:**  
`rails db:create`  
`rails db:migrate`


## Gem Dependencies

- [roo](https://github.com/roo-rb/roo): A gem for reading spreadsheet files like Excel, Google Sheets, etc.
- [rspec](https://rspec.info/): A testing framework for Ruby applications, allowing you to write specifications (tests) in a readable and expressive manner.
- [rubocop](https://rubocop.org/): A Ruby static code analyzer and formatter based on the community Ruby style guide.

Make sure to include these gems in your Gemfile and run `bundle install` to install them along with other project dependencies.

## Testing

We use RSpec for testing our application. You can run the test suite using the following command:

"rspec"

### Usage
#### Importing Retailers
To import retailers from a file, you can use the following Rake task:  

`rails import:retailers FILE_PATH=/path/to/your/file.xlsx`  
Replace /path/to/your/file.xlsx with the actual path to your XLSX file containing retailer data.

If you run the import:retailers task without specifying the FILE_PATH environment variable, you'll be prompted to input the file path interactively.

#### Updating Search Index
To update the search index with the imported retailer data, you can use the following Rake task:  
`rake search:update_index`    
Ensure that the update_index task is configured to correctly pipe the output of your application into the command responsible for updating the search index.  


## Happy Coding! 

Congratulations on setting up the Retailers Importer! We hope this tool simplifies the process of importing and managing retailer data for your project.

Remember, software development is a journey filled with challenges and triumphs. Don't hesitate to explore, experiment, and innovate with this application. We're here to support you every step of the way.

Happy coding, and may your projects be successful and fulfilling!

If you have any questions, feedback, or ideas for improvement, feel free to reach out to us. Together, let's make great things happen!

---


