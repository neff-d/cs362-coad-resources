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

    factory :defaultOrganization2, class: Organization do
        name { 'Default Organization 2' }
        description { 'Default Organization 2' }
        email { 'org2@example.com' }
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

    factory :defaultUser2, class: User do
        email { 'example@example.com' }
        password { 'password' }
        organization { create(:defaultOrganization2) }
    end

    factory :adminUser, class: User do
        email { 'admin@example.com' }
        password { 'password' }
        admin { true }
    end

    factory :resource_category, class: ResourceCategory do
        name { 'test rc'}
        organizations { create(:defaultOrganization) }
        #organizations << create(:defaultOrganization)
        tickets { create(:defaultTicket) }
        #tickets << create(:defaultTicket2)

        resource_category.activate

    end    

    factory :region, class: Region do
        name { 'test region'}
        tickets { create(:defaultTicket) }
        #tickets << create(:defaultTicket2)
    end

    
    factory :defaultTicket, class: Ticket do
        closed { false }
        phone {'+15555555555'}
        id { 1 }
        organization { create(:defaultOrganization) }
        resource_category { create(:resource_category) }
        region { create(:region) }
    end

    factory :defaultTicket2, class: Ticket do
        closed { false }
        phone {'+15555555555'}
        id { 2 }
        organization { create(:defaultOrganization2) }
        resource_category { create(:resource_category) }
        region { create(:region) }
    end

end