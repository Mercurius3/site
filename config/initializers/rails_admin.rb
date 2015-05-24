# RailsAdmin config file. Generated on July 17, 2013 20:57
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Site', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = []

  # Include specific models (exclude the others):
  # config.included_models = []

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  config.authorize_with do |controller|
    unless current_user.try(:admin?)
      flash[:error] = "U bent geen admin"
      redirect_to main_app.root_path
    end
  end
  
  config.actions do 
    dashboard
    index
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    show_in_app
    
    nestable
  end
  
  config.model Product do
    nestable_list true
		edit do
			field :name
			field :startdate do
				label "startdatum"
			end
			field :purchasable do
				label "bestelknop"
			end
			field :active do
				label "nu in programma"
			end
			field :third_party do
				label "voor ander bedrijf"
			end
			field :price do
				label "prijs"
			end
			field :offer do
				label "aanbiedingsprijs"
			end
			field :category do
				label "categorie"
			end
			field :position do
				label "positie"
			end
			field :teacher do
				label "docent(-en)"
			end
			field :location do
				label "locatie"
			end
			field :timefield do
				label "tijd"
			end
			field :description do
				label "tekst"
				html_attributes rows: 30, cols: 80
			end
			field :short_description do
				label "korte tekst voor in de lijst"
			end
			field :picture
		end
  end

  config.model Page do
    nestable_list true
  end
  
  config.model User do
    nestable_list true
    edit do
      field :first_name
      field :middle_name
      field :last_name
      field :email
      field :mobile
      field :street
      field :street_number
      field :post_code
      field :city
      field :news_letter
      field :admin
    end
  end

  
  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:


end
