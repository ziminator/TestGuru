module ApplicationHelper

  ALERT_TYPES = {
    alert: "danger",
    notice: "info"
  }.freeze

  def flash_messages
    flash.map do |type, message|
      class_type = "flash #{ALERT_TYPES[type.to_sym]}"
      content_tag :div, message, class: class_type, role: 'alert'
    end.join("\n").html_safe
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

end
