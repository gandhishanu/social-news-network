class User < ActiveRecord::Base
  
  has_secure_password  	

  has_many :votes
  has_many :comments
  has_many :authorizations
  has_many :posts
  validates :name, :email, :presence => true
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
                                  
 has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy     
                                   
                                  
  has_many :following, through: :active_relationships, source: :followed
   has_many :followers, through: :passive_relationships, source: :follower
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
  
    def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
    end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end


  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
  end
end
