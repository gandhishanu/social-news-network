class Authorization < ActiveRecord::Base
    belongs_to :user
    validates :provider, :uid, :user_id, :user, :presence => true
    
    def self.find_or_create(auth_hash)
      unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
        puts("!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        user = User.create :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
        auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      end
        puts("XXXXXXXXXXXXXXXXXXX")
      auth
    end
end
