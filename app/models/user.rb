class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  # custom callbacks
  after_initialize :set_default_role, :if => :new_record?

  # enumerables
  enum role: [:user, :admin]

  def set_default_role
    self.role ||= :user
  end
end
