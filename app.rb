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

  def add_a_game
    print 'Enter game name: '
    game_name = gets.chomp

    print 'Enter author first_name: '
    first_name = gets.chomp

    print 'Enter author last_name: '
    last_name = gets.chomp

    print 'Enter the publish date [YYYY-MM-DD]: '
    publish_date = gets.chomp

    print 'Is it a multiplayer? [Y/N]: '
    player = gets.chomp.downcase
    multiplayer = true_or_false(player)

    print 'It was last played at [YYYY-MM-DD]: '
    last_played_at = gets.chomp

    games_info = {
      game_name: game_name,
      first_name: first_name,
      last_name: last_name,
      publish_date: publish_date,
      multiplayer: multiplayer,
      last_played_at: last_played_at
    }

    Author.new(first_name, last_name)
    GameDetails.new(games_info)

    data = {
      'game_name' => game_name,
      'first_name' => first_name,
      'last_name' => last_name,
      'publish_date' => publish_date,
      'multiplayer' => multiplayer,
      'last_played_at' => last_played_at
    }

    store_to_array(data)

    puts 'Game Created Successfully'
  end
end
