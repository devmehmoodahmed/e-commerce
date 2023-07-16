class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def admin?
    type == "admin"
  end

  def vendor?
    type == "vendor"
  end
end
