ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Recent Restaurants" do
          ul do
            Restaurant.last(10).map do |restaurant|
              li link_to(restaurant.name, edit_admin_restaurant_path(restaurant))
            end
          end
        end
      end

      column do
        panel "Recent Hungry People" do
          ul do
            HungryPerson.last(10).map do |person|
              li link_to(person.telephone_number, edit_admin_hungry_person_path(person))
            end
          end
        end
      end
    end
  end
end
