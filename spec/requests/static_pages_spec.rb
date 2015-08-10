require 'spec_helper'

describe "Static pages" do

	subject{ page }

	describe "Home page" do
  		before{ visit root_path }

  		it{ should have_content('青商祭2015') }
  		it{ shuold have_title(full_title('')) }
  		it{ should_not have_title('| Home') }
	end

	describe "About page" do
  		before{ visit about_path }

  		it{ should have_content('このアプリについて') }
  		it{ should have_title(full_title("このアプリについて")) }
	end

end