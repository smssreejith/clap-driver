class Customer < ApplicationRecord
  enum sex: [ "Male", "Female" ]
  enum refferal_type: [ "Medium", "Person" ]
end
