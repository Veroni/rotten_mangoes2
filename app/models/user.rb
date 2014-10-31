class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  def full_name
    "#{firstname} #{lastname}"
  end
end

