FactoryBot.define do
    factory :defaultOrganization, class: Organization do
        name { 'Default Organization' }
        description { 'Default Organization' }
        email { 'org@example.com' }
        phone { '555-555-5555' }
        primary_name { 'Default' }
        secondary_name { 'Organization' }
        secondary_phone { '555-555-5555' }

    end

    factory :defaultUser, class: User do
        email { 'example@example.com' }
        password { 'password' }

        organization { create(:defaultOrganization) }

    end

    factory :adminUser, class: User do
        email { 'admin@example.com' }
        password { 'password' }
        admin { true }
    end

    factory :defaultTicket, class: Ticket do
        closed { false }
        phone {'+15555555555'}
        resource_category_id { 76 }
    end

    factory :resource_category, class: ResourceCategory do
        name { 'test rc'}       
        
    end    

    factory :region, class: Region do
        name { 'test region'}
    end
end