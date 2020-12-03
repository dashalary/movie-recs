[x] Uses the Ruby on Rails Framework

  Models: 
    [x] one has_many 
            user has_many movies
            category has_many movies
    [x] one belongs_to 
            movie belongs_to user
            movie belongs_to category
    [x] two has_many :through
            user has_many :categories, through: :movies
            category has_many :users, through: :movies 
    [x] Joins table must have user-submittable attributes 
            main joins table: Movies has many user-submittable attributes including:
                title
                release_year 
                seen
                category
    [x] must include reasonable validations for simple attributes
            validates that movie title, release year, and category must be present and category must have a name

[x] Include at least one ActiveRecord scope method
        scope :seen, -> { where(seen: true) }
        
[x] Include third party signup/login (how e.g. Devise/OmniAuth)  
        OmniAuth with GitHub

[x] Include nested resource show or index   
        Has nested show route (categories/:id/movies/:id) that allows users to view a specific movie in a specific category

[x] Include nested resource "new" form 
        Has a nested new route (new_category_movie_path) where the new movie form already knows its category

[x] Include form display of validation errors 
        Uses field_with_error as a class to add styling to the error(s) display


Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [x] Views use partials if appropriate