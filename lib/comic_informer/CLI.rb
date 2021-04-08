class ComicInformer::CLI #namespacing this CLI module that belongs to ComicInformer Class

  def call
    puts "Welcome to Comic Informer!",""
      user_options
      list_user_options
      puts "","Please select an option from the list above."
      get_user_input
  end

  def get_comic_list
    if @chosen_option == 1
      raw_new = ComicInformer::API.new_release
      raw_new["comics"].first(10)
    elsif @chosen_option == 2
      raw_future = ComicInformer::API.future_release
      raw_future["comics"].first(10)
    elsif @chosen_option == 3
      raw_last = ComicInformer::API.last_week_release
      raw_last["comics"].first(10)
    else
      valid_input
    end
  end

  def user_options
    @user_options = ["New Releases", "Next Weeks Releases", "Last Weeks Releases"]
  end

  def list_user_options
    @user_options.each_with_index do |release, index|
      puts "#{index + 1}. #{release}"
    end
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
      get_user_input
    end
  end

  def show_comics(chosen_option)
    comic_list = @user_options[chosen_option - 1]
    puts "Here is the list of the #{comic_list}"
    puts get_comic_list
  end

  def goodbye
    puts "Come back next week for new list of comics! Happy Reading!"
  end

end
