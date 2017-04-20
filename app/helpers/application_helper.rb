module ApplicationHelper

  def full_address
    [street_line1, street_line2, street_line3, postal_code].compact.join(', ')
  end
  
end
