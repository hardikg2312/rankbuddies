class User < ActiveRecord::Base

  attr_accessor :password
  before_save :encrypt_password
  
  validates_presence_of   :email
  validates_uniqueness_of :email
  validates_length_of     :email,    :within => 3..100
  validates_format_of     :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of   :user_name
  validates_uniqueness_of :user_name
  validates_length_of     :user_name,    :within => 3..40
  validates_confirmation_of :password
  validates_presence_of   :password, :on => :create
  validates_length_of     :password,    :within => 5..40

  has_many :authentications
  has_many :posts   
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  class << self

    def authenticate(email, password)
      user = find_by_email(email) || find_by_user_name(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end
    
    def add_auth_user(omniauth)
      if omniauth['provider'] == "twitter"
        user = omniauth_user_create(omniauth)
        verify_auth_user_saved(omniauth,user)
      elsif omniauth['provider'] == "facebook"
        user = omniauth_user_create(omniauth)
        verify_auth_user_saved(omniauth,user)
      elsif omniauth['provider'] == "google_oauth2"
        user = omniauth_user_create(omniauth)
        verify_auth_user_saved(omniauth,user)
      end
    end

    def omniauth_user_create(omniauth)
      name = omniauth['info']['name']
      user_name = name.downcase.tr(" ",".") + rand(200).to_s
      email = user_name + "@#{omniauth['provider']}.com" if omniauth['provider'] != "google_oauth2"
      email = user_name + "@googleoauth.com" if omniauth['provider'] == "google_oauth2"
      provider_email = omniauth["info"]["email"] || email
      password =  rand(99999999).to_s
      User.new(:email => email, :password => password, :password_confirmation => password, :user_name => user_name, :provider_email => provider_email)
    end

    def verify_auth_user_saved(omniauth,user)
      if user.save 
        user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
        return user
      else
        return false
      end
    end

  end
end
