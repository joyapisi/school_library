require 'json'
require './school_library_app'

def main
  school_app = SchoolLibraryApp.new
  school_app.start
  school_app.save_all_data
end

main
