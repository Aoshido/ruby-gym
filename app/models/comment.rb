class Comment < ApplicationRecord
  include Visible

  belongs_to :log
end
