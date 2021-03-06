class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook]

  has_many :articles
  has_many :comments

  include PermissionsConcern

  def avatar
  	email_address = self.email.downcase

  	#create the md5 hash
  	hash = Digest::MD5.hexdigest(email_address)

  	#compile URL which can be used in <img
  	image_src = "http://www.gravatar.com/avatar/#{hash}"
  end

  def self.from_omniauth(auth)
    where(provider: auth['provider'], uid: auth['uid']).first_or_create do |user|
      user.email = auth['info']['email']
      user.encrypted_password = Devise.friendly_token
      user.name = auth['info']['name']
      user.avatar = auth['info']['image']
    end
  end
end
