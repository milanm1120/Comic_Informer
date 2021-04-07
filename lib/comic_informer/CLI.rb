class ComicInformer::CLI #namespacing this CLI module that belongs to ComicInformer Class

  def call
    puts "Welcome to Comic Informer!"
    user_options
    list_user_options
    get_user_option
    show_comics
  end

  def user_options
    @user_options = ["New Releases", "Future Releases", "Previously Released"]
  end

  def list_user_options
    @user_options.each_with_index do |release, index|
      puts "#{index + 1}. #{release}"
    end
  end

  def get_user_option
    chosen_option = gets.strip.to_i
    show_comics(chosen_option) if valid_input(chosen_option, @user_options)
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

  def show_comics(chosen_option)
    comic_list = @user_options[chosen_option - 1]
    puts "Here is the list of the #{comic_list}"
    binding.pry
  end

end
