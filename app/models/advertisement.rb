class Advertisement < ApplicationRecord
  belongs_to :user

  include AASM

  aasm column: 'state' do
    state :draft, initial: true
    state :new, :rejected, :approved, :published, :archived

    event :create do
      transitions from: :draft, to: :new
    end

    event :reject do
      transitions from: :new, to: :rejected
    end

    event :rewrite do
      transitions from: :rejected, to: :draft

    event :approve do
      transitions from: :new, to: :approved
    end

    event :publish do
      transitions from: :approved, to: :published
    end

    event :archive do
      transitions from: :published, to: :archived
    end
  end
end
