module ApplicationHelper
  def fix_url(url)
    url.starts_with?("http://") ? url : "http://#{url}"
  end

  def display_datetime(dt)
    dt = dt.in_time_zone(current_user.time_zone) if logged_in? && !current_user.time_zone.blank?
    dt.strftime("%m/%d/%Y %l:%M%P %Z") 
  end
end
