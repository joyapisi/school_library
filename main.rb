require 'json'
require './school_library_app'
# require_relative 'data_storage'

def main
  school_app = SchoolLibraryApp.new
  school_app.start
  school_app.save_data_to_json
  # test = DataStorage.new
  # test.save_data_to_json
end

main
