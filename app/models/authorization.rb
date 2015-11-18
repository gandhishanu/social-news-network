class Authorization < ActiveRecord::Base
    belongs_to :user
    validates :provider, :uid, :presence => true
    
    def self.find_or_create(auth_hash)
      unless (auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]))
        arbitrary_password = SecureRandom.urlsafe_base64
        user = User.create_user! :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"], :password => arbitrary_password, :password_confirmation => arbitrary_password
        auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"], :session_token => user.session_token
      end

      auth
    end
end
