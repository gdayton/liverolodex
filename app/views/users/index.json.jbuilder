json.array!(@users) do |user|
  json.extract! user, 
				:id, 
				:first_name, 
				:last_name, 
				:email, 
				:company_id, 
				:role, 
				:created_at,
				:updated_at, 
				:image, 
				:manager_id, 
				:work_phone, 
				:mobile_phone,
				:video_platform,
				:video_handle,
				:start_date,
				:about_me,
				:resp,
				:job_role
  #json.url user_url(user, format: :json)
end
