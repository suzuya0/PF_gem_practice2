ActiveAdmin.register Book do
  permit_params :title, :price, :published
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  filter :title
  
  show do
    attributes_table do
      row(:title)
      row(:price) do|book|
        "#{book.price}円"
      end
      row(:published)do|book|
        book.published_i18n
      end
      row(:created_at)
      row(:updated_at)
    end
  end
  
  index do
    selectable_column
    column(:id)
    column(:title)
    column(:price) do |book|
      "#{book.price}円"
    end
    column(:published) do |book|
      book.published_i18n
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :price
      f.input :published, as: :select, collection:Book.publisheds_i18n.invert
    end
    f.actions
  end
end

