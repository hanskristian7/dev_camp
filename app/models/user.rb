class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def first_name
    self.name.split.first
  end

  def last_name
    if self.name.split.count > 1
      self.name.split.last
    else
      ""
    end
  end
end
