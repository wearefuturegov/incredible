[![Build Status](http://img.shields.io/circleci/project/github/wearefuturegov/incredible.svg?style=flat-square)](https://circleci.com/gh/wearefuturegov/incredible)
[![Coverage Status](http://img.shields.io/coveralls/wearefuturegov/incredible.svg?style=flat-square)](https://coveralls.io/r/wearefuturegov/incredible)
[![Code Climate](http://img.shields.io/codeclimate/github/wearefuturegov/incredible.svg?style=flat-square)](https://codeclimate.com/github/wearefuturegov/incredible)
[![Gem Version](http://img.shields.io/gem/v/Incredible.svg?style=flat-square)](https://rubygems.org/gems/Incredible)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://wearefuturegov.mit-license.org)

# Incredible

Build multi-page forms like a [General](https://www.youtube.com/watch?v=mL2Bgj-za5k).

Incredible uses the power of [Wicked](https://github.com/schneems/wicked) to allow you to build multi-page, ActiveRecord model-based, Rails forms using a simple YAML-based format.

## Installation
Add this line to your Rails application's Gemfile:

```ruby
gem 'incredible'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install incredible
```

## Usage

*NOTE:* Incredible is still a work in progress and at an early stage, so these docs are subject to change (and definitely need improving!)

First, create a YAML file in `config/forms` - for example `config/forms/my_awesome_form.yml`.

Here's an example:

```YAML
form:
  name: 'Test form'
  steps:
    step1:
      template: foo
      rules:
        name:
          'Mike': :step3
      questions:
        - name: :name
          title: Your full name
          widget: :input
        - name: :postcode
          title: Your postcode
          widget: :input
    step2:
      template: bar
      questions:
        - name: :email
          title: Email
          widget: :email
        - name: :phone_number
          title: Phone Number
          widget: :tel
    step3:
      template: :baz
```

Each step *must* have a template, and questions as a minimum.  

Next create a model:

```bash
rails g model form name:string postcode:string email:string postcode:string
rails db:migrate
```

Note how all the columns refer to a question in your YAML file.

Then create a controller:

```bash
rails g controller forms/build
````

Add Routes into config/routes.rb:

```Ruby
resources :forms do
  resources :build, controller: 'forms/build'
end
```

Next include `Incredible::Wizard` in your controller

```Ruby
class Forms::BuildController < ApplicationController
  include Incredible::Wizard

  form 'my_awesome_form'
end
```

(Where `my_awesome_form` is the name of the YAML file you created)

Next add `show`, `create` and `new` methods to your controller

```Ruby
class Forms::BuildController < ApplicationController
  include Incredible::Wizard
  
  form 'my_awesome_form'
  
  def show
    render_wizard nil, template: "forms/#{template}"
  end

  def update
    @form = Form.find(params[:id])
    render_wizard @form
  end
  
  def new
    redirect_to wizard_path(steps.first, foster_check_id: foster_check.id)
  end
  
end
```

Next, you'll need to have a controller that creates your model and redirects to the form. Run this:

```bash
rails g controller forms
````

Then edit your controller:

```ruby
class FormsController < ApplicationController
  
  def create
    form = Form.create
    redirect_to new_form_build_path(form_id: form.id)
  end
  
end
```

More docs coming soon!

## Contributing
See [CONTRIBUTING.md](https://github.com/wearefuturegov/incredible/blob/master/CONTRIBUTING.md)

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
