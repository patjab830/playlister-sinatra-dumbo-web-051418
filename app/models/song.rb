class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres

  belongs_to :artist

  def slug
    self.name.split.join("-").downcase
  end

  def self.find_by_slug(slug)
    #Song.find_by(name: slug.split("-").map {|name| name.capitalize}.join(" "))
    # Song.where("lower(name) = ?", unslug(slug))
    Song.where("lower(name) like ?", slug.gsub('-','%'))
  end

  # def self.unslug(slug)
  #   slug.split("-").map {|name| name}.join(" ")
  # end
end
