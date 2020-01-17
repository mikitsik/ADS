class Advertisement < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  include AASM

  aasm column: 'state' do
    state :draft, initial: true
    state :new, :rejected, :approved, :published, :archived

    event :create, guard: :user_user? do
      transitions from: :draft, to: :new
    end

    event :reject, guard: :user_admin? do
      transitions from: :new, to: :rejected
    end

    event :approve, guard: :user_admin? do
      transitions from: :new, to: :approved
    end

    event :publish do
      transitions from: :approved, to: :published
    end

    event :archive do
      transitions from: :published, to: :archived
    end

    event :rewrite, guard: :user_user? do
      transitions from: [:rejected, :archived], to: :draft
    end
  end

  def user_admin?
    current_user.role == 'admin'
  end

  def user_user?
    current_user.role == 'user'
  end
end
