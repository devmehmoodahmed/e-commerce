class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def admin?
    type == "Admin"
  end

  def vendor?
    type == "Vendor"
  end
end
