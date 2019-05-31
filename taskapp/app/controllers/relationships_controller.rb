class RelationshipsController < ApplicationController

  def friends
    Relationship.create_reciprocal_for_ids(params[:user_id], params[:friend_id])
<<<<<<< HEAD
=======
    
>>>>>>> 4d85029019d2c0efd80d47765b2c04e4408abdcd
  end



end
