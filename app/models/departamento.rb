class Departamento < ActiveRecord::Base
	has_many :projects
end
