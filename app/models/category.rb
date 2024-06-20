class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :title, :color, :icon, presence: true

  enum color: { primary: 0, success: 1, danger: 2, warning: 3, info: 4 }
  enum icon: {
         'backpack' => 0,
         'bank' => 1,
         'basket' => 2,
         'briefcase' => 3,
         'bus-front' => 4,
         'cup-hot' => 5,
         'fuel-pump' => 6,
         'heart' => 7,
         'house' => 8,
         'lungs' => 9,
         'rocket-takeoff' => 10,
         'scissors' => 11,
         'shop' => 12,
         'suitcase' => 13,
         'tablet' => 14,
         'ticket' => 15,
         'wrench' => 16
       }

  COLORS_TO_HEX = {
    primary: '#0d6efd',
    success: '#198754',
    info: '#0dcaf0',
    warning: '#ffc107',
    danger: '#dc3545'
  }

  def hex_color
    COLORS_TO_HEX[color.to_sym]
  end
end
