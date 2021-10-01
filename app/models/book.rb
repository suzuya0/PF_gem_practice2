class Book < ApplicationRecord
  enum published:{already:1,unreleased:2}

end
