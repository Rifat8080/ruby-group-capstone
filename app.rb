require_relative 'classes/music_albums'

class App
  attr_accessor :id, :books, :music_albums, :genres, :games, :labels, :authors, :book_details

  def initialize
    @books = []
    @music_albums = []
    @genres = []
    @games = []
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
    if @games
  end
end
