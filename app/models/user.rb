class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :payments
  has_many :user_payments


  def paid_amount
    @paid_amount ||= user_payments.sum(:amount)
  end

  def outstanding_amount
    @outstanding_amount ||= (payments.sum(:amount) - paid_amount)
  end
end
