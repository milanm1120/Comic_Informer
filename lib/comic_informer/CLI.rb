class ComicInformer::CLI #namespacing this CLI module that belongs to ComicInformer Class

  #start of the CLI program. ComicInformer::CLI.new.call is called under ./bin/comic_informer
  #welcomes user and shows user valid inputs. Option 4 is the exit the program.
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

  #names of  user options.
  def list_options
    @options = ["New Releases", "Future Releases", "Last Weeks Releases", "Exit"]
    @options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}".blue
    end
    puts "\nPlease select an option from the list above."
  end

  #gets user input from terminal. Shows comic list after verifying throught valid input medthod.
  def get_user_input
    @input = gets.strip.to_i
    show_list(@input) if valid_input(@input, @options)
  end

  #checks to make sure user input is a valid input. Only integers are valid inputs. 0 and anything > then the displayed options is an invalid input.
  #invalid inputs will ask for user to enter a valid input
  def valid_input(input, options)
    if @input.to_i <=  options.length && @input.to_i > 0
      true
    else
      puts "\nYour input was not recognized. Please enter a valid selection.\n".red
    end
  end

  #will allow to show Publisher list only if user input is valid
  def show_list(chosen_option)
    @options[chosen_option - 1]
    print_publisher_list
  end

  #list of new releases/future release/previous releases or exit the program.
  # defines @comics based upon user selection.
  def print_publisher_list
    case @input
      when 1
        puts "\nHere is a list of this weeks Newest Releases:\n".red
        @comics = ComicInformer::API.new_release
        level_two
      when 2
        puts "\nHere is a list of Future Releases:\n".red
        @comics = ComicInformer::API.future_release
        level_two
      when 3
        puts "\nHere is a list of Last Weeks Releases:\n".red
        @comics = ComicInformer::API.last_week_release
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

  # get unique list publishers from ComicInformer::Publsher
  def publisher_list
    @publishers = ComicInformer::Publisher.get_unique_publishers(@comics)
  end

  # list avilable publishers for the week.
  def publisher_index
    @publishers.each_with_index do |publisher, index|
      puts "#{index + 1}. #{publisher}".cyan
    end
    puts "\nPlease select a publisher from the list above.\n"
  end

  #shows list of publisher once users input is validated.
  def publisher_user_input
    @publisher_input = gets.strip.to_i
    show_publishers(@publisher_input) if publisher_list_validation(@publisher_input, @publisher)
  end

  #validating publisher selection. If invalid input, asks user to enter valid input
  def publisher_list_validation(publisher_input, publishers)
    if @publisher_input.to_i <= @publishers.length && @publisher_input.to_i > 0
      true
    else
      puts "\nYour input was not recognized. Please enter a valid selection\n".red
      publisher_user_input
    end
  end


  def show_publishers(publisher_input)
    user_input_of_publisher = @publishers[publisher_input.to_i-1]

    # filter the list on the publisher
    ComicInformer::Publisher.filter_comics(@comics, user_input_of_publisher)
  end

  #goodbye message to user.
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
