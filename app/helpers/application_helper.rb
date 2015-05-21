module ApplicationHelper
  def notifications
    js_str = ''

    flash.each do |type, message|
      js_str += "flashMsg('#{message}', '#{type}');"
    end

    js_str.html_safe
  end

  def format_date(date, default_date = true)
    date = Date.today if date.nil? && default_date
    date ? date.strftime('%d/%m/%Y') : ''
  end

  def active_class(controller)
    (params[:controller] == controller) && 'active'
  end

  def calculate_md5(string)
    m = Digest::MD5.new
    m.update(string)
    m.hexdigest
  end
end
