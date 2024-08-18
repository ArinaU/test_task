# frozen_string_literal: true

module Users
  class Create < ActiveInteraction::Base
    string :name, :surname, :patronymic, :email, :nationality, :country, :gender
    integer :age
    string :fullname, default: nil
    array :interests, :skills, default: []

    validates :name, :patronymic, :email, :age, :nationality, :country, :gender, presence: true
    validates :age, numericality: { greater_than_or_equal_to: 0, less_than: 90 }
    validates :gender, inclusion: { in: GENDERS }

    validates :email, presence: true, length: { maximum: 255 },
              format: { with: URI::MailTo::EMAIL_REGEXP }

    set_callback :validate, :before, -> { self.email = email.downcase }

    attr_reader :user

    def execute
      ActiveRecord::Base.transaction do
        setup_user
        attach_interests
        attach_skills
        user.save!

        user
      end
    end

    private

    def setup_user
      if User.exists?(email: email)
        errors.add(:email, "User already exists")
        return
      end

      @user = User.new(
        name: name,
        surname: surname,
        patronymic: patronymic,
        email: email,
        nationality: nationality,
        country: country,
        gender: gender,
        age: age
      )

      @user.fullname ||= [surname, name, patronymic].compact.join(' ')
    end

    def attach_interests
      return if interests.empty?

      existing_interests = Interest.where(name: interests).to_a
      new_interests = interests - existing_interests.map(&:name)

      new_interests.each do |name|
        existing_interests << Interest.create!(name: name)
      end

      user.interests = existing_interests
    end

    def attach_skills
      return if skills.empty?

      existing_skills = Skill.where(name: skills).to_a
      new_skills = skills - existing_skills.map(&:name)

      new_skills.each do |name|
        existing_skills << Skill.create!(name: name)
      end

      user.skills = existing_skills
    end
  end
end