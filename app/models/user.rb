class User < ActiveRecord::Base
  has_secure_password
  # Assumptions:
  # - "password_digest" is a column in the users table
  # - a User is asked for a 'password'
  # - 'password' is encrypted and stored in the passowrd_digest column
  # - ensures that 'password_confirmation' field matches 'password'
  # - 'bcrypt' gem has been activated in Gemfile
  
  # :password_digest removed from attr_accessible for security
  attr_accessible :email, :fname, :lname, :password, :password_confirmation
  
  validates :fname, :presence => true
  validates :lname, :presence => true
  validates :email, :presence => true, :uniqueness => true
  # Note: has_secure_password validates that 'password' matches 'password_confirmation'
  
end
