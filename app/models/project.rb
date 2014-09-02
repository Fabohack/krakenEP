class Project < ActiveRecord::Base

  JSON_ATTRIBUTES = [
    "id", "iteration_length", "iteration_start_day", "start_date",
    "default_velocity", "descripcion","presupuesto"
  ]
  JSON_METHODS = ["last_changeset_id", "point_values"]

  
  POINT_SCALES = {
    'Alta'  => [0],
    'Media' => [1],
    'Baja'  => [2],
  }
  validates_inclusion_of :point_scale, :in => POINT_SCALES.keys,
    :message => "%{value} no es un esquema de estimacion valido"
    
  ITERATION_LENGTH_RANGE = (1..12)
  validates_numericality_of :iteration_length,
    :greater_than_or_equal_to => ITERATION_LENGTH_RANGE.min,
    :less_than_or_equal_to => ITERATION_LENGTH_RANGE.max, :only_integer => true,
    :message => "Debe estar entra 1- 12 meses"

  validates_numericality_of :iteration_start_day,
    :greater_than_or_equal_to => 0, :less_than_or_equal_to => 6,
    :only_integer => true, :message => " debe ser un numero entero entre 0 - 6"

  validates :name, :presence => true

  validates_numericality_of :default_velocity, :greater_than => 0,
                            :only_integer => true

  has_and_belongs_to_many :users, -> { uniq }

  accepts_nested_attributes_for :users, :reject_if => :all_blank

  has_many :stories, :dependent => :destroy do  

  
    # Populates the stories collection from a CSV string.
    def from_csv(csv_string)

      # Eager load this so that we don't have to make multiple db calls when
      # searching for users by full name from the CSV.
      users = proxy_association.owner.users

      csv = CSV.parse(csv_string, :headers => true)
      csv.map do |row|
        row_attrs = row.to_hash
        story = create({
          :state        => row_attrs["Current State"].downcase,
          :title        => row_attrs["Title"] || row_attrs["Story"],
          :story_type   => (row_attrs["Type"] || row_attrs["Story Type"]).downcase,
          :requested_by => users.detect {|u| u.name == row["Requested By"]},
          :owned_by     => users.detect {|u| u.name == row["Propietario"]},
          :accepted_at  => row_attrs["Aceptado"],
          :estimate     => row_attrs["Estimado"],
          :labels       => row_attrs["Etiquetas"],
          :description  => row_attrs["Descripcion"]
        })

        # Generate notes for this story if any are present
        story.notes.from_csv_row(row)

        story
      end
    end

  end
  has_many :changesets, :dependent => :destroy

  attr_writer :suppress_notifications

  scope :with_stories_notes, -> { includes(stories: :notes) }

  def suppress_notifications
    @suppress_notifications || false
  end

  def to_s
    name
  end

  # Returns an array of the valid points values for this project
  def point_values
    POINT_SCALES[point_scale]
  end

  def last_changeset_id
    changesets.last && changesets.last.id
  end

  def as_json(options = {})
    super(:only => JSON_ATTRIBUTES, :methods => JSON_METHODS)
  end

  def csv_filename
    "#{name}-#{Time.now.strftime('%Y%m%d_%I%M')}.csv"
  end
end
