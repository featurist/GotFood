ActiveAdmin.register Restaurant do
  permit_params :name, :telephone_number

  index do
    selectable_column
    id_column
    column :name
    column :telephone_number
    actions
  end

  filter :name
  filter :telephone_number

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :telephone_number
    end
    f.actions
  end

end
