module ApplicationHelper
  def current_class?(test_path)
    return 'active' if request.path.include? test_path
  end

  def current_menu_class?(array_path)
    array_path.each do |path|
      return 'active' if request.path.include? path
    end
  end
end
