# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Users
User.create!([
               {
                 name: 'Иван',
                 surname: 'Иванов',
                 patronymic: 'Иванович',
                 fullname: 'Иван Иванов Иванович',
                 email: 'ivan.ivanov@example.com',
                 age: 30,
                 nationality: 'Русский',
                 country: 'Россия',
                 gender: 'male'
               },
               {
                 name: 'Мария',
                 surname: 'Петрова',
                 patronymic: 'Сергеевна',
                 fullname: 'Мария Петрова Сергеевна',
                 email: 'maria.petrov@example.com',
                 age: 25,
                 nationality: 'Русская',
                 country: 'Россия',
                 gender: 'female'
               },
               {
                 name: 'Алексей',
                 surname: 'Сидоров',
                 patronymic: 'Анатольевич',
                 fullname: 'Алексей Сидоров Анатольевич',
                 email: 'aleksey.sidorov@example.com',
                 age: 40,
                 nationality: 'Русский',
                 country: 'Россия',
                 gender: 'male'
               }
             ])

# Interests
Interest.create!([
                   { name: 'Чтение' },
                   { name: 'Футбол' },
                   { name: 'Кулинария' },
                   { name: 'Программирование' },
                   { name: 'Путешествия' }
                 ])

# Skills
Skill.create!([
                { name: 'Ruby' },
                { name: 'JavaScript' },
                { name: 'Python' },
                { name: 'Английский язык' },
                { name: 'Проектирование' }
              ])

# Assign interests to users
InterestsUser.create!([
                       { user_id: 1, interest_id: 1 }, # Иван - Чтение
                       { user_id: 1, interest_id: 2 }, # Иван - Футбол
                       { user_id: 2, interest_id: 3 }, # Мария - Кулинария
                       { user_id: 2, interest_id: 5 }, # Мария - Путешествия
                       { user_id: 3, interest_id: 4 }  # Алексей - Программирование
                     ])

# Assign skills to users
SkillsUser.create!([
                    { user_id: 1, skill_id: 3 }, # Иван - Python
                    { user_id: 2, skill_id: 1 }, # Мария - Ruby
                    { user_id: 3, skill_id: 2 }  # Алексей - JavaScript
                  ])
