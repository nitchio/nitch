module ApplicationHelper
  def class_if_path_matches(css_class, matcher)
    if matcher =~ request.path
      css_class
    end
  end
end
