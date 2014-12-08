ActiveAdmin.register Restaurant do
  permit_params :name, :postcode, :telephone_number

  index do
    selectable_column
    id_column
    column :name
    column :postcode
    column :telephone_number
    actions
  end

  filter :name
  filter :postcode
  filter :telephone_number

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :postcode
      f.input :telephone_number
    end
    f.actions
  end

end
