require 'json'
require_relative './classes/school_library_app'
# require_relative 'data_storage'

def main
  school_app = SchoolLibraryApp.new
  school_app.start
  # test = DataStorage.new
  # test.save_data_to_json
end

main
