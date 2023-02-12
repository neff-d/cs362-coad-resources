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
        organization { Organization.new(name: 'Default Organization', description: 'Default Organization', email: 'example@example@gmail.com', phone: '555-555-5555', primary_name: 'Default', secondary_name: 'Organization', secondary_phone: '555-555-5555') }
    end

    factory :adminUser, class: User do
        email { 'admin@example.com' }
        password { 'password' }
        role { :admin }
    end

    factory :resource_category, class: ResourceCategory do
        name { 'test rc'}
    end    

    factory :region, class: Region do
        name { 'test region'}
        #tickets { Ticket.new(name: 'test ticket', phone: '+15555555555', closed: false, organization: Organization.new(name: 'Default Organization', description: 'Default Organization', email: 'example@example@gmail.com', phone: '555-555-5555', primary_name: 'Default', secondary_name: 'Organization', secondary_phone: '555-555-5555'), resource_category: ResourceCategory.new(name: 'test rc')) }
    end
    
    factory :defaultTicket, class: Ticket do
        closed { false }
        phone {'+15555555555'}
        name { 'test ticket 1'}
        id { 1 }
        organization {  Organization.new(name: 'Default Organization', description: 'Default Organization', email: 'example@example@gmail.com', phone: '555-555-5555', primary_name: 'Default', secondary_name: 'Organization', secondary_phone: '555-555-5555') }
        resource_category { ResourceCategory.new(name: 'test rc22') }
        region { create(:region) }
    end
end