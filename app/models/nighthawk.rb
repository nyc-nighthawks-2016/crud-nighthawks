class Nighthawk < ActiveRecord::Base
  # Remember to create a migration!

  validates :name, :home, presence: true

  # validate :custom_age_validation

  belongs_to :user


  def custom_age_validation
    if home
      @errors.add('home', "can not be less than 10") unless home.length > 10
    end
  end
end
