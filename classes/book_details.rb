require_relative 'label'
require_relative 'book'
require_relative '../menu'

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