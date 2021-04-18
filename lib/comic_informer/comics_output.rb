class ComicInformer::ComicsOutput
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
        output = "\nTitle: #{comic['title']}\nCreators: #{comic['creators']}\nRelease Date: #{comic['release_date']}\nPrice: #{price['price']}"

        if comic['description'] != ''
          output += "Description: #{comic['description']}\n"
        end

        puts output
      end
    end
  end
end

#
# arr = [1,3,4,56,103,4]
# result = []
# arr.each do
#   if num > 10
#     result.push num
#   end
# end
