class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  def slug
    # @@index = self.name.split('').each_with_index.select{|word, index| word=='-'}.map{ |array| array.last}
    # @index = self.name.split('').index{|word| word=='-'}
    self.name.split.join("-").downcase
  end

  def self.find_by_slug(slug)
    # Artist.where("lower(name) = ?", unslug(slug))
    Artist.where("lower(name) like ?", slug.gsub('-','%'))
  end

#   def self.unslug(slug)
#     slug_broken = slug.split("-").map {|name| name}.join(" ")
#     unslug = Array.new
#     slug_broken.split('').each_with_index{|char, index| @@index.include?(index) ? y << '-' : y << char }
#     return unslug
#   end
#
# x = "string with spaces".split('')
# y = Array.new
# @@index{|index| x[index] = '-'}
# x.each_with_index{|char, index| @@index.include?(index) ? y << '-' : y << char }

end
