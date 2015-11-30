class User < ActiveRecord::Base
  
<<<<<<< HEAD
    #attr_accessible :user_id, :name, :email
  
    has_many :authorizations
=======
  has_secure_password  	

  has_many :votes
  has_many :comments
  has_many :authorizations
  validates :name, :email, :presence => true
>>>>>>> 5364f3094a0c6430604347214090093ac9da0215
    
    #before_save { self.email = email.downcase }
    #validates :user_id, presence: true, length: { maximum: 50 }
    #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
    
    
    def self.create_user! (hash)
      session = SecureRandom.base64
      hash[:session_token]= session
      User.create!(hash)
    end

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 230 }, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness:{case_sensitive:false}
   #/\A(.)*[a-z]+\d*@[a-z]+\d*.[a-z]+/i
      has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
    def add_provider(auth_hash)
      # Check if the provider already exists, so we don't add it twice
      unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
        Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      end
    end
end
