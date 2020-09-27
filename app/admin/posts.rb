ActiveAdmin.register Post do

  permit_params :user_id, :title, :body, :image, :kind, :tag_list, :status

end
