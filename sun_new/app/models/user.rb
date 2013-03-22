class User < ActiveRecord::Base
 attr_accessible :password, :login, :salt
  validates :login, :presence => true
 has_many :posts
 has_many :comments 
  def password
    @password
  end
  def password=(pass)
    return unless pass
     @password = pass
      generate_password(pass)
  end
  def self.authentication(login,password)
    user = User.find_by_login(login)
    if user && Digest::SHA256.hexdigest(password + user.salt ) == user.hashed_password
      return user
    else
         false
    end
  end
  private
  def generate_password(pass)
    salt = Array.new(10){rand(1024).to_s(36)}.join
    self.salt,self.hashed_password = salt, Digest::SHA256.hexdigest(pass + salt )
  end
end
