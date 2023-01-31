class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  before_create do
    self.title = title.capitalize
  end
  after_create :status_print
  
  private
    def status_print
      print "An article has been cretaed"
    end
end
