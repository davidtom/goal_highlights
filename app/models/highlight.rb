# == Schema Information
#
# Table name: highlights
#
#  id                 :integer          not null, primary key
#  title              :string
#  permalink          :string
#  url                :string
#  media              :text
#  media_embed        :text
#  secure_media       :text
#  secure_media_embed :text
#  created            :integer
#  created_utc        :integer
#  domain_id          :integer
#  player_id          :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Highlight < ActiveRecord::Base
  belongs_to :domain
  belongs_to :player

  validates :title, uniqueness: true

  def self.create_assignment_hash(post)
    {
      title: post.title,
      permalink: post.permalink,
      url: post.url,
      media: post.media,
      media_embed: post.media_embed,
      secure_media: post.secure_media,
      secure_media_embed: post.secure_media_embed,
      created: post.created,
      created_utc: post.created_utc
    }
  end

  def clean_media_embed
    #Slice out text between <iframe> tags and remove backlashes
    iframe_string = self.media_embed.scan(/<iframe.+<\/iframe>/)[0].gsub("\\","")
  end

  def self.utc_to_date(utc_integer)
    DateTime.strptime("#{utc_integer}",'%s').to_date
  end

  def self.all_group_and_order_by_date
    #TODO MAKE THIS MORE DESCRIPTIVE
    #Sort goals in ascending order by 'created_utc'; group by created_at.to_date
    #Returns a hash: {created_at.to_date: [highlights]} -sorted asc
    sorted_hash = {}
    self.order("created_utc ASC").each do |highlight|
      # date = highlight.created_at.to_date
      date = utc_to_date(highlight.created_utc)
      sorted_hash[date] = [] if sorted_hash[date].nil?
      sorted_hash[date] << highlight
    end
    #sort hash by keys; descending order by date
    Hash[sorted_hash.sort_by{|date, highlights| date}.reverse]
  end

end
