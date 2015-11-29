class User < ActiveRecord::Base
  
  has_secure_password  	

  has_many :votes
  has_many :comments
  has_many :authorizations
  validates :name, :email, :presence => true
    
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 230 }, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness:{case_sensitive:false}
  validates :password, presence: true, length: { minimum: 6 }
  validates_confirmation_of :password

    
  def self.create_user! (hash)
    hash[:email_confirm_string] = SecureRandom.uuid
    hash[:session_token] = SecureRandom.urlsafe_base64	
    User.create!(hash)
  end

  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
  end
  	
 
  
end

