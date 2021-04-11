class ComicInformer::CLI #namespacing this CLI module that belongs to ComicInformer Class

  def call
    puts "","Welcome to Comic Informer!",""
    while @input != 4
      options
      list_user_options
      get_user_input
    end
  end

  def options
    @options = ["New Releases", "Future Releases", "Last Weeks Releases", "Exit"]
  end

  def list_user_options
    @options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
    puts "","Please select an option from the list above."
  end

  def get_user_input
    @input = gets.strip.to_i
    show_comics(@input) if valid_input(@input, @options)
  end

  def valid_input(input, data)
    if input.to_i <= data.length && input.to_i > 0
      true
    else
      puts "Please enter a valid selection"
    end
  end

  def show_comics(chosen_option)
    comic_list = @options[chosen_option - 1]
    print_comic_list
  end

  def print_comic_list
    if @input == 1
      puts "Here is this weeks Newest Releases:"
      ComicInformer::API.new_release
    elsif @input == 2
      puts "Here are Future Releases:"
      ComicInformer::API.future_release
    elsif @input == 3
      puts "Here is Last Weeks Releases"
      ComicInformer::API.last_week_release
    else @input == 4
      goodbye
    end
  end

  def goodbye
    puts "Come back next week for new list of comics! Happy Reading!",""
  end

end
