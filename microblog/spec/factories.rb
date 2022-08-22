FactoryBot.define do
  
    factory :blog do
        title {"Kiran"}
        body {"it is good"}
        status {1}
    end

    factory :user do
        email { "jane.doe@hey.com" }
        password { "SecretPassword" }
    end
end
