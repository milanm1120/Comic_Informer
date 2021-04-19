class ComicInformer::CLI #namespacing this CLI module that belongs to ComicInformer Class

  #start of the CLI program. ComicInformer::CLI.new.call is called under ./bin/comic_informer
  #welcomes user and shows user valid inputs. Option 4 is the exit the program.
  def call
    puts "","Welcome to Comic Informer!",""
    while @input != 4
      options
      list_user_options
      get_user_input
    end
  end

  #names of  user options.
  def options
    @options = ["New Releases", "Future Releases", "Last Weeks Releases", "Exit"]
  end

  #indexes user options. index +1 because arrays start at 0, allows user input to start at 1.
  def list_user_options
    @options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
    puts "","Please select an option from the list above."
  end

  #gets user input from terminal. Shows comic list after verifying throught valid input medthod.
  def get_user_input
    @input = gets.strip.to_i
    show_list(@input) if valid_input(@input, @options)
  end

  #checks to make sure user input is a valid input. Only integers are valid inputs. 0 and anything > then the displayed options is an invalid input.
  #invalid inputs will ask for user to enter a valid input
  def valid_input(input, options)
    if @input.to_i <= options.length && @input.to_i > 0
      true
    else
      puts "","Your input was not recognized. Please enter a valid selection.",""
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
        puts "","Here is a list of this weeks Newest Releases:",""
        @comics = ComicInformer::API.new_release
        publisher_list
      when 2
        puts "","Here is a list of Future Releases:",""
        @comics = ComicInformer::API.future_release
        publisher_list
      when 3
        puts "","Here is a list of Last Weeks Releases",""
        @comics = ComicInformer::API.last_week_release
        publisher_list
      when 4
        goodbye
    end
  end

  def publisher_list
    # get unique list publishers from ComicInformer::Publsher
    @publishers = ComicInformer::Publisher.get_unique_publishers(@comics)
    publisher_index
    publisher_user_input
  end

    # list avilable publishers for the week.
  def publisher_index
    @publishers.each_with_index do |publisher, index|
      puts "#{index + 1}. #{publisher}"
    end
    puts "","Please select a publisher from the list above."
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
      publisher_index
      puts "","Your input was not recognized. Please enter a valid selection"
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
    puts "Come back next week for a brand new list of comics! Happy Reading!",""
  end

end
