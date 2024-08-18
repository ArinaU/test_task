# require Rails.root.join('app', 'models', 'users', 'create')

namespace :Users do
  namespace :Create do

    task users_create: :environment do
      params = {
        name: 'Кузьма',
        surname: 'Кузьмин',
        patronymic: 'Кузьминович',
        fullname: 'Кузьма Кузьмин Кузьминович',
        email: 'kuzma.kuzmin@example.com',
        age: 30,
        nationality: 'Русский',
        country: 'Россия',
        gender: 'male',
        interests: ['Музыка', 'Футбол'],  # Array of interests
        skills: ['Ruby', 'Python']        # Array of skills
      }


      Users::Create.run(params)
    end
  end
end