# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :researcher

  enum role: { user: 0, intern: 1, researcher: 2, admin: 3 }

  def name_with_initial
    if first_name.empty?
      "#{email}"
    else
      "#{first_name} #{last_name}"
    end
  end
end
