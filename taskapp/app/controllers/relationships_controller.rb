class RelationshipsController < ApplicationController

  def friends
    Relationship.create_reciprocal_for_ids(params[:user_id], params[:friend_id])
    
  end



end
