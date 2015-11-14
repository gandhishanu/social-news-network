class User < ActiveRecord::Base
  
    #attr_accessible :name
  
    has_many :authorizations
    
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
