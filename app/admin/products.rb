ActiveAdmin.register Product do
  permit_params :title, :description, :price, :images

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :price
    column :images
    actions
  end

  filter :title
  filter :description
  filter :price
  filter :images

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :images, as: :file
    end
    f.actions
  end
end
