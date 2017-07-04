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

  def self.sort_day_and_time(hash)
    #hash must have Dates as keys and highlight instances as values
    #sort keys/Dates ascending; sort within keys/Dates by time ascending

    # TODO: THIS IS WRONG!!! SORT VALUE ARRAY DESCENDING; THEN SORT KEYS DESCENDING
    time_sort = hash.sort_by{|date, highlight| highlight[0].created_utc}.to_h
    date_sort = time_sort.sort_by{|date, highlight| date}.reverse.to_h
  end

  def self.group_all_by_date
    self.all.each_with_object({}) do |highlight, goals_by_day|
      date = highlight.created_at.to_date
      goals_by_day[date] = [] if goals_by_day[date].nil?
      goals_by_day[date] << highlight
    end
  end

  def self.group_and_sort_all
    grouped_hash = group_all_by_date
    sort_day_and_time(grouped_hash)
  end
end
