class Place < ActiveRecord::Base
	
	validates_presence_of :name
	validates_presence_of :address
	validates_presence_of :phone
	validates_presence_of :website
	validates_presence_of :user_id

	#Association with User
	belongs_to :user


	geocoded_by :address
	after_validation :geocode

	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode  # auto-fetch address


	has_many :reviews, dependent: :destroy

end
