class Exam < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :submissions, dependent: :destroy

  validates :title, presence: true, length: {minimum: 3, maximum: 80}
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  before_save do 
    self.time = 1 if time.nil?
  end

  after_create :send_notifications_to_users

  scope :sort_by_title, -> { order(title: :asc) }
  scope :sort_by_score, -> { all.sort_by(&:total_score) }

  def total_score
    questions.sum(:score)
  end

  def self.search(term)
    if term.present?
      where("title LIKE ?", "%#{term}%")
    else
      all
    end
  end

  def top_score
    submissions.order('score DESC').limit(3)
  end

  private
    def send_notifications_to_users
      User.all.each do |user|
        Notification.create!(content: "New exam is created", user: user)
      end
    end

end

=begin
params = { exam: {
  title: 'final exam', time: 1, category_id: 1, 
  questions_attributes: [
    { title: 'Kari, the awesome Ruby documentation browser!', score: 10,
      options_attributes: [
        { content: 'hello', is_correct: true},
        { content: 'hi'}
      ]
    },
    { title: 'The egalitarian assumption of the modern citizen', score: 10 },
  ]
}}
exam = Exam.create(params[:exam])
=end