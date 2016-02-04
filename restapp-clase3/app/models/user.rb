class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         
    has_one :profile
    
    enum role: [:user, :operator, :chef, :admin]
    after_initialize :set_default_role


    def set_default_role
      self.role ||= :user
    end


    def default_profile
      if self.profile.nil?
        profile = Profile.new
        profile.user = self
        profile.save
        self.save      
      end
      self.profile
    end

    def friendly_name
      if self.default_profile.first_name.nil?
        self.email
      else
        self.profile.full_name
      end
    end
    
end
