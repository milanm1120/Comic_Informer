class ComicInformer::CLI

  def level_one
    logo
    while @input != 4
      list_options
      get_user_input
    end
  end

  def logo
    puts ""
    puts "MMMMMMMMMMMMMMMMMMMMM.                              MMMMMMMMMMMMMMMMMMMMM".yellow
    puts " `MMMMMMMMMMMMMMMMMMMM           M    M            MMMMMMMMMMMMMMMMMMMM'".yellow
    puts "   `MMMMMMMMMMMMMMMMMMM          MMMMMM          MMMMMMMMMMMMMMMMMMM'".yellow
    puts "     MMMMMMMMMMMMMMMMMMM-_______MMMMMMMM_______-MMMMMMMMMMMMMMMMMMM".yellow
    puts "      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM".yellow
    puts "      MMMMMMMMMMMMMMMM                             MMMMMMMMMMMMMMM".yellow
    print "      MMMMMMMMMMMMMMM".yellow  
    print "   Welcome to Comic Informer!  ".white   
    puts "MMMMMMMMMMMMMM".yellow
    puts "     .MMMMMMMMMMMMMMMM                             MMMMMMMMMMMMMMM.".yellow
    puts "    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM".yellow
    puts "                     `MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'".yellow
    puts "                          `MMMMMMMMMMMMMMMMMM'".yellow
    puts "                              `MMMMMMMMMM'".yellow
    puts "                                 MMMMMM".yellow
    puts "                                  MMMM".yellow
    puts "                                   MM".yellow
  end

  def list_options
    @options = ["New Releases", "Future Releases", "Last Weeks Releases", "Exit"]
    @options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}".blue
    end
    puts "\nPlease select an option from the list above."
  end

  def get_user_input
    @input = gets.strip.to_i
    show_list(@input) if valid_input(@input, @options)
  end

  def valid_input(input, options)
    if @input.to_i <= options.length && @input.to_i > 0
      true
    else
      puts "\nYour input was not recognized. Please enter a valid selection.\n".red
    end
  end

  def show_list(chosen_option)
    @options[chosen_option - 1]
    print_publisher_list
  end

  def print_publisher_list
    case @input
      when 1
        puts "\nHere is a list of this weeks Newest Releases:\n".red
        @api_list = ComicInformer::API.new_release
        ComicInformer::Comic.create_objects_from_api(@api_list)
        level_two
      when 2
        puts "\nHere is a list of Future Releases:\n".red
        @api_list = ComicInformer::API.future_release
        ComicInformer::Comic.create_objects_from_api(@api_list)
        level_two
      when 3
        puts "\nHere is a list of Last Weeks Releases:\n".red
        @api_list = ComicInformer::API.last_week_release
        ComicInformer::Comic.create_objects_from_api(@api_list)
        level_two
      when 4
        goodbye
    end
  end

  def level_two
    publisher_list
    publisher_index
    publisher_user_input
  end

  def publisher_list
    @publisher_list = ComicInformer::Comic.publishers
  end

  def publisher_index
    @publisher_list.each_with_index do |publisher, index|
      puts "#{index + 1}. #{publisher}".cyan
    end
    puts "\nPlease select a publisher from the list above.\n"
  end

  def publisher_user_input
    @user_publisher_input = gets.strip.to_i
    show_publishers(@user_publisher_input) if publisher_list_validation(@user_publisher_input, @publisher_list)
  end

  def publisher_list_validation(user_publisher_input, publisher_list)
    if @user_publisher_input.to_i <= @publisher_list.length && @user_publisher_input.to_i > 0
      true
    else
      puts "\nYour input was not recognized. Please enter a valid selection\n".red
      publisher_user_input
    end
  end

  def show_publishers(user_publisher_input)
    user_input_of_publisher = @publisher_list[user_publisher_input.to_i-1]
    @filtered_list = ComicInformer::Comic.publisher_filter(user_input_of_publisher)
    show_comics
  end

  def show_comics
    @filtered_list.each do |comic|
      comic.show
    end
  end

  def goodbye

    puts "          ,,########################################,,".red
    puts "       .*##############################################*".red
    puts "     ,*####*:::*########***::::::::**######:::*###########,".red
    puts "   .*####:    *#####*.                 :*###,.#######*,####*.".red
    puts "  *####:    *#####*                      .###########*  ,####*".red
    puts ".*####:    ,#######,                        ##########*    :####*".red
    puts "*####.    :#########*,                       ,,,,,,,,.      ,####:".red
    puts "  ####*  ,##############****************:,,               .####*".red
    puts "   :####*#####################################**,        *####.".red
    puts "     *############################################*,   :####:".red
    puts "Come back next week for a brand new list of comics! Happy Reading!"
    puts "       :#####:*****#####################################.".red
    puts "         *####:                  .,,,:*****###########,".red
    puts "          .*####,                            *######*".red
    puts "            .####* :*#######*               ,#####*".red
    puts "              *###############*,,,,,,,,::**######,".red
    puts "                *##############################:".red
    puts "                  *####*****##########**#####*".red
    puts "                   .####*.            :####*".red
    puts "                     :####*         .#####,".red
    puts "                       *####:      *####:".red
    puts "                        .*####,  *####*".red
    puts "                          :####*####*".red
    puts "                            *######,".red
    puts "                              *##,".red
    puts ""
  end

end
