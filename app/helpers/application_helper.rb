module ApplicationHelper
  def current_class?(test_path)
    return 'active' if request.path.include? test_path
  end

  def current_menu_class?(array_path)
    array_path.each do |path|
      return 'active' if request.path.include? path
    end
  end

  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe

  end
end
