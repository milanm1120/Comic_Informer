class ComicInformer::Comic
    attr_accessor :title, :creators, :description, :release_date, :price

    @@all = []

    def initialize(title, creators, description, release_date, price, publisher)
        @title = title
        @creators = creators
        @description = description
        @release_date = release_date
        @price = price
        @publisher = publisher
        save
    end

        #reader method for publisher
    def publisher
        @publisher
    end

    def self.create_objects_from_api(api_list)
        api_list['comics'].each do |comic|
            self.new(
                comic['title'],
                comic['creators'],
                comic['description'],
                comic['release_date'],
                comic['price'],
                comic['publisher']
            )
        end
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.publishers
        publishers =[]
        @@all.each do |comic|
            publishers << comic.publisher
        end
        publishers.uniq.sort!
    end

    def self.publisher_filter(input)
        @@all.select do |comic|
            comic.publisher == input
        end
    end

    def show
        puts "\nTitle: #{@title}".red if @title != ''
        puts "Creators: #{@creators}".blue if @creators != ''
        puts "Release Date: #{@release_date}".yellow if @release_date != ''
        puts "Description: #{@description}" if @description != ''
        puts "Price: #{@price}".green if @price != ''
        puts ""
    end

end
