class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create 
    # initializes a song and saves it to the @@all class variable 
    # either literally or through the class method
    s = self.new 
    s.save 
    s
  end 
 
  def self.create_by_name(string_name_of_the_song)
    # takes in the string name of a song and returns a 
    # song instance with that name set as its name property 
    s = self.new 
    s.name = string_name_of_the_song
    s.save 
    s
    # and the song being saved into the @@all class variable.
  end
 
  def self.new_by_name(string_name_of_the_song)
    s = self.new 
    s.name = string_name_of_the_song
    s
  end 
  
  def self.find_by_name(string_name_of_the_song) 
    self.all.detect {|i| i.name == string_name_of_the_song}
  end
  
  def self.find_or_create_by_name(find_this_song)
    did_i_find_it = self.all.detect {|x| x.name == find_this_song}
    if did_i_find_it == nil
      s = self.new 
      s.name = find_this_song
      s.save 
      s
    else
      did_i_find_it
    end
  end 

  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end 
  
  def self.new_from_filename(mp3_formatted_file)
    c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c
  end 
  
  def self.create_from_filename(mp3_formatted_file)
    c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c.save
    c
  end 
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
 
end