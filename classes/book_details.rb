require_relative 'label'
require_relative 'book'
require_relative '../menu'
require 'json'

class BookDetails
  attr_accessor :books

  def inititalize
    @books = []
    @labels = []
    load_books
    load_labels
  end

  def display_options
    loop do
      puts ''
      puts 'Welcome to our catalog of books! Please select an option by entering a number:'
      puts '1. Add book'
      puts '2. List all books'
      puts '3. List labels'
      puts '4. Exit'

      choice = gets.chomp.to_i

      case choice
      when 1
        add_a_book
      when 2
        list_all_books
      when 3
        list_labels
      when 4
        break
      else
        puts 'Invalid choice. Please try again'
      end
    end
  end

  def add_a_book
    puts ''
    puts 'Enter book title: '
    title = gets.chomp

    puts ''
    puts 'Enter publisher: '
    publisher = gets.chomp

    puts ''
    puts 'Enter cover state (good/bad/average): '
    cover_state = gets.chomp.downcase

    puts ''
    puts 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    puts ''
    puts 'Enter Label color '
    color = gets.chomp.downcase

    book = Book.new(title, publisher, cover_state: cover_state, publish_date: publish_date)
    label = Label.new(title, color)
    label.add_item(book)
    book.label = label

    save_data_to_json(title, publisher, cover_state, publish_date, color)
    puts "Added #{book.title} to your catalog."
  end

  def list_all_books
    if @books.empty?
      puts 'You have no books in your catalog.'
    else
      @books.each do |item|
        puts "publisher: #{item['publisher']}, cover state: #{item['cover_state']},
        publish date: #{item['publish_date']}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'You have no labels in your catalog.'
    else
      @labels.each do |label|
        print "'#{label['title']}', '#{label['color']}'"
        puts ''
      end
    end
  end

  def save_data_to_json(title, publisher, cover_state, publish_date, color)
    @books << {
      'title' => title,
      'publisher' => publisher,
      'cover_state' => cover_state,
      'publish_date' => publish_date
    }

    @labels << {
      'title' => title,
      'color' => color
    }
    File.write('./DATABASE/books.json', JSON.pretty_generate(@books))
    File.write('./DATABASE/labels.json', JSON.pretty_generate(@labels))
  end

  def load_books
    data_books = JSON.parse(File.read('./DATABASE/books.json'))
    @books = data_books
  rescue JSON::ParseError => e
    puts "Error parsing books.json: #{e.message}"
  end

  def load_labels
    data_labels = JSON.parse(File.read('./DATABASE/labels.json'))
    @labels = data_labels
  rescue JSON::ParserError => e
    puts "Error parsing labels.json: #{e.message}"
  end
end
