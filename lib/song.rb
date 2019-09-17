class Song
  
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    s = self.new 
    s.save
    s 
  end
  
  def self.create_by_name(string_name_of_the_song)
    s = self.new 
    s.name = string_name_of_the_song
    s.save 
    s
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

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
