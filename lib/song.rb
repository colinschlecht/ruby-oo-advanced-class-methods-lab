require 'pry'
class Song
  attr_accessor :name, :artist_name, :song, :clean_file
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    !self.find_by_name(name) ? self.create_by_name(name) : self.find_by_name(name)
  end
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end


  def self.clean_file(file)
    split1 = file.split(" - ")
    words = split1.map do |word|
      word.split(".")
    end.flatten
    words
  end

  def self.file_to_song(file)
    song_file = self.clean_file(file)
    artist_name = song_file[0]
    name = song_file[1]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.new_from_filename(file)
    song = self.file_to_song(file)
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end
  # def self.new_from_filename(file)
  #   split1 = file.split(" - ")
  #   words = split1.map do |word|
  #     word.split(".")
  #   end.flatten
  #   artist_name = words[0]
  #   name = words[1]
  #   song = self.new
  #   song.name = name
  #   song.artist_name = artist_name
  #   song
  # end



  def self.destroy_all
    self.all.clear
  end

end

