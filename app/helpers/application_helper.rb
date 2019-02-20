module ApplicationHelper

  #if on active page color = white
  #if not on active page color = regular

  def active_link_to (nav_link, contrl, action, url, style)
    if controller_name == contrl && action_name == action
      return link_to nav_link, url, id: style
    else
      return link_to nav_link, url, class: style
    end
  end

#create a list of countries of the world in and Array
  def your_country
    countries = ["Afghanistan",
                  "Albania",
                  "Algeria",
                  "Andorra",
                  "Angola",
                  "Antigua and Barbuda",
                  "Argentina",
                  "Armenia",
                  "Aruba",
                  "Australia",
                  "Austria",
                  "Azerbaijan"]
    countries.each do |country|
      my_country = "#{country}"
    end
    return countries
  end
end
