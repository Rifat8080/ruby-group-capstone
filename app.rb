require_relative 'classes/music_albums'

class App
  attr_accessor :id, :books, :music_albums, :genres, :games, :labels, :authors, :book_details

  def initialize
    @books = []
    @music_albums = []
    @genres = []
    @games = []
    @labels = []
    @authors = []
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No music albums added, please add some music albums.'
    else
      puts 'List of all music albums:'
      @music_albums.each do |album|
        puts "#{album['title']} by #{album['artist']},\nGenre: #{album['genre']}, Released: #{album['release_year']}"
      end
    end
  end

  def list_all_genres
    puts 'No genres added yet.' if @genre.empty?
    puts 'List of all genres:'
    genre_names = @genres.map { |genre| "'#{genre['name'].capitalize}'" }
    puts genre_names.join(', ')
  end

  def list_of_games
    if @games.empty?
      puts 'Oops! No available games, select 9 to add new game'
    else
      @games.each_with_index do |game, index|
        puts "#{index + 1}'#{game['game_name']}' by #{game['first_name']}"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'Oops there are no Authors!'
    else
      @authors.each do |author|
        puts "'#{author['first_name']} #{author['last_name']}'"
      end
    end
  end
end
