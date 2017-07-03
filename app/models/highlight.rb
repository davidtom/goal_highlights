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
end