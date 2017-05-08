class Employee < ActiveRecord::Base
  belongs_to(:division)
    scope(:not_assigned, -> do
    where({:assignment => false})
  end)
end
