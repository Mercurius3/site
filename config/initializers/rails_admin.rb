RailsAdmin.config do |config|
	config.model Product do
		list do
			field :name do
				column_width 250
			end
			field :active do
				column_width 50
			end
		end
	end
	config.authenticate_with do
		warden.authenticate! scope: :user
	end
	config.current_user_method(&:current_user)
end
