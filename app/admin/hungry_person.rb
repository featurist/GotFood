ActiveAdmin.register HungryPerson do
  permit_params :telephone_number

  index do
    selectable_column
    id_column
    column :telephone_number
    actions
  end

  filter :telephone_number

  form do |f|
    f.inputs "Details" do
      f.input :telephone_number
    end
    f.actions
  end

end
