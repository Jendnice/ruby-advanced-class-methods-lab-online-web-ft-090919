  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end
  
# In above, the self.all was already defined to read the variable @@people. This initially had @@people.find, but subbed in the method def. that used @@people to abstract it.  





class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    #@@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
      #if self.find_by_name(name) == nil 
        #self.create_by_name(name)
      #else
        #self.find_by_name(name)
      #end
      self.find_by_name(name) || self.create_by_name(name)
      #the above statement is saying do this(if it is true) or that (if the first thing is not true and the second thing is true)
  end
  
  def self.alphabetical()
    #returns all the songs instances in ascending (a-z) alphabetical order.
    @@all.sort_by{|x| x.name}
  end
  
  
  def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end
  
  def self.create_from_filename(name)
  #class method should not only parse the filename correctly but should also save the song
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end
  
  def self.destroy_all()
    #reset the state of the @@all class variable to an empty array thereby deleting all previous song instances.
    @@all.clear
  end

end