class ComicInformer::Publisher
  def self.get_unique_publishers(comics)
    publishers = []
    # binding.pry
    comics['comics'].each do |comic|
      publishers << comic['publisher']
    end
    publishers.uniq.sort!
  end

  def self.filter_comics(comics, user_input_of_publisher)
    comics['comics'].each do |comic|
      if user_input_of_publisher == comic['publisher']
        output = "\nTitle: #{comic['title']}\nCreators: #{comic['creators']}\nRelease Date: #{comic['release_date']}\n"

        if comic['description'] != ''
          output << "Description: #{comic['description']}\n"

          output << "Price: #{comic['price']}"
        end

        puts output
        puts "\n"
      end
    end
  end
end
