class VersionMove < ApplicationRecord
    belongs_to :version
    belongs_to :move
end
