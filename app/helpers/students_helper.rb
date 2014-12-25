module StudentsHelper
	def infinite_scroll_link
		url = link_to_next_page(@students, '', :remote => true)
		if !url.nil?
			if params.has_key?(:term) && !@students.last_page?
				url = link_to '', params.merge({ page: @students.current_page + 1 }), remote: true, rel: "next"
			end	
		end		
		url
	end
end
