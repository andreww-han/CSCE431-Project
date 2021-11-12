module MemberHelper
	 def sortable(collumn, title = nil)
		title ||= collumn.titleize
		direction = collumn == params[:sort] && params[:direction] == "ASC" ? "DESC" : "ASC"
		link_to title, :sort => collumn, :direction => direction
	end
end
