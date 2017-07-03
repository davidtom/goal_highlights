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
#  date_indexed       :datetime
#  domain_id          :integer
#  player_id          :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Highlight < ActiveRecord::Base
  belongs_to :domain
  belongs_to :player

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

  def self.create_or_ignore(assignment_hash)
    #check if post title is in database already. If no, create new row. if yes,
    # return the matching row (so api_controller#scan doesn't break)
    highlight = self.find_by(title: assignment_hash[:title])
    if highlight.nil?
      self.create(assignment_hash)
    else
      highlight
    end
  end
end
