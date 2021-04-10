class ComicInformer::CLI #namespacing this CLI module that belongs to ComicInformer Class

  def call
    puts "Welcome to Comic Informer!",""
    while @chosen_option != 4
      user_options
      list_user_options
      get_user_input
    end
  end

  def user_options
    @user_options = ["New Releases", "Future Releases", "Last Weeks Releases", "Exit"]
  end

  def list_user_options
    @user_options.each_with_index do |options, index|
      puts "#{index + 1}. #{options}"
    end
    puts "","Please select an option from the list above."
  end

  def get_user_input
    @chosen_option = gets.strip.to_i
    show_comics(@chosen_option) if valid_input(@chosen_option, @user_options)
  end

  def valid_input(input, data)
    if input.to_i <= data.length && input.to_i > 0
      true
    else
      puts "Please enter a valid selection"
    end
  end

  def show_comics(chosen_option)
    comic_list = @user_options[chosen_option - 1]
    get_comic_list
  end

  def get_comic_list
    if @chosen_option == 1
      puts "Here is this weeks Newest Releases:"
      ComicInformer::API.new_release
    elsif @chosen_option == 2
      puts "Here are Future Releases:"
      ComicInformer::API.future_release
    elsif @chosen_option == 3
      puts "Here is Last Weeks Releases"
      ComicInformer::API.last_week_release
    else @chosen_option == 4
      goodbye
    end
  end

  def goodbye
    puts "Come back next week for new list of comics! Happy Reading!"
  end

end
