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
#  created_at         :datetime
#  updated_at         :datetime
#

class Highlight < ActiveRecord::Base

end
