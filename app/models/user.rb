class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tracks

  enum role: [:guest, :artist, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :artist
    end
  end

  def set_user
    @user = current_user
  end
end
