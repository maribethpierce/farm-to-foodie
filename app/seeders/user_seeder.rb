class UserSeeder
  USERS = [
    {
      name: "Maribeth",
      email: "maribeth@email.com",
      password: "password",
      password_confirmation: "password",
      farmer: true
    }, {
      name: "Al",
      email: "al@email.com",
      password: "password",
      password_confirmation: "password",
      farmer: true
    }, {
      name: "Katy",
      email: "katy@email.com",
      password: "password",
      password_confirmation: "password",
      farmer: true
    }, {
      name: "Remi",
      email: "remi@email.com",
      password: "password",
      password_confirmation: "password",
      foodie: true
    }, {
      name: "Rhunell",
      email: "rhunell@email.com",
      password: "password",
      password_confirmation: "password",
      foodie: true
    }, {
      name: "Marian",
      email: "marian@email.com",
      password: "password",
      password_confirmation: "password",
      foodie: true
    }, {
      name: "Don",
      email: "don@email.com",
      password: "password",
      password_confirmation: "password",
      farmer: true
    }
  ]
  def self.seed!
    USERS.each do |user|
      User.find_or_create_by!(user)
    end
  end
end
