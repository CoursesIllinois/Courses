Courses::Application.routes.draw do

  root :to => 'Home#index', :as => :welcome
  
  # Login button routes
  match 'login/student' => 'home#student', :as => :student_login
  match 'login/teacher' => 'home#teacher', :as => :teacher_login

  resources :users do
    resources :notify_prefs
  end

  # Authentication Routes
  match 'auth/:provider/:callback' => 'Sessions#create'

  # CoursesDisplay Routes
  match 'courses/save_sections' => 'CoursesDisplay#save_sections', :as => :save_sections
  match 'courses/remove_section/:section_id' => 'CoursesDisplay#remove_section', :as => :remove_section
  match 'courses/add_section/:section_id' => 'CoursesDisplay#add_section', :as => :add_section
  match 'courses/:major/:course' => 'CoursesDisplay#section', :as => :showSections
  match 'courses/:major' => 'CoursesDisplay#course', :as => :showCourses
  match 'courses/' => 'CoursesDisplay#index', :as => :courses


  # Student Routes
  match 'student/' => "Student#index", :as => :student_index
	
  # Teacher Routes
  match 'teacher/' => "Teacher#index", :as => :teacher_index
  match 'teacher/announce' => "Teacher#announce", :as => :announce
#  match 'teacher/announce/:type/:title/:description/:dueDate/' => "Teacher#announce", :as => :teacher_announce

  # Scraper Routes
#  match 'scrape/:semester/:year' => 'CourseScraper#scrape'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
