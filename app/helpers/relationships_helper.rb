module RelationshipsHelper
  def follow_user(relationship)
    @follow = User.find(relationship.follow_id)
  end
end
