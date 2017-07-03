# == Schema Information
#
# Table name: domains
#
#  id          :integer          not null, primary key
#  domain_name :string
#  created_at  :datetime
#  updated_at  :datetime
#

class Domain < ActiveRecord::Base
  has_many :highlights
end
