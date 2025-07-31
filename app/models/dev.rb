class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

    def received_one?(item_name)
      return true if freebies.find_by(item_name: item_name)
      return false
    end

    def give_away(new_dev, freebie)
      if id == freebie.dev.id
        freebie.update(dev_id: new_dev.id)
      else
        "ITS NOT YOURS"
      end
    end
end
