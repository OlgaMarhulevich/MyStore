module ApplicationHelper

# не работает!!!

def urls_to_images(s)
  # заменяет все совпадения на строку содержащуюся во втором аргументе
  s.gsub! /\s(http:\/\/.*?\.(png|jpeg|jpg))/,
      '<p><img src="\1"/></p>'
  s.html_safe
end

def urls_to_links(s)
  s.gsub! /\s(http:\/\/.*)/,
      '<a href="\1"/>\1</a>'
  s.html_safe
end

end
