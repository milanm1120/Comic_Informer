class ComicInformer::Publisher

  #method to collect unique publishers from API, add them to @publisher array, and sorts alphapetically.
  def self.get_unique_publishers(api_list)
    publishers = []
    api_list['comics'].each do |comic|
      publishers << comic['publisher']
    end
    publishers.uniq.sort!
  end

  #shows filter list of comics by publisher based upon users selection. Will list Title:, Creators:, Release Date:
  #will add Description: if a valid description is avilable via API
  #will add Price: at the end
  def self.filter_comics(api_list, user_input_of_publisher)
    output = []
    api_list['comics'].each do |comic|
      if
        user_input_of_publisher == comic['publisher']
        output << "\nTitle: #{comic['title']}".red
        output << "Creators: #{comic['creators']}".blue
        output << "Release Date: #{comic['release_date']}".yellow

        if
          comic['description'] != ''
          output << "Description: #{comic['description']}\n"

          output << "Price: #{comic['price']}".green
        end
        puts output
        puts "\n"
      end
    end
  end

end
