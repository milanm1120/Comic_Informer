class ComicInformer::CLI #namespacing this CLI module that belongs to ComicInformer Class

  def call
    puts "Welcome to Comic Informer!"
    user_options
    list_user_options
    get_user_option
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
    chosen_option = gets.strip
    if valid_input(chosen_option.to_i, @user_options)
    end
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

end
