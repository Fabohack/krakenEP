class ProyDepa < ActiveRecord::Base
	has_many :Projects
end
class Project < ActiveRecord::Base
    belongs_to :ProyDepa
end