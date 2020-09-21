ActiveAdmin.register Post do

  permit_params :user_id, :title, :body, :image

end
