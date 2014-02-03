server "your_app.com", roles: %w{db web app}

set :stage, lambda { "staging" }

load_recipes do
  #
  # Recipes you wish to include for staging stage only
  # for example:
  #
  # server :passenger
  # notify :campfire
end
