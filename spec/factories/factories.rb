FactoryBot.define do
    factory :defaultOrganization, class: Organization do
        sequence (:name) { |n| "Test Organization #{n}" }
        description { 'Default Organization' }
        sequence (:email) { |n| "example#{n}@example.com" }
        phone { '555-555-5555' }
        primary_name { 'Default' }
        secondary_name { 'Organization' }
        secondary_phone { '555-555-5555' }
        liability_insurance { true }
        title { 'title' }
        transportation { :yes }

        trait :approved do
            status { 0 }
        end

        trait :rejected do
            status { 2 }
        end

    end

    factory :defaultUser, class: User do
        before(:create) { |user| user.skip_confirmation! }
        email { 'example@example.com' }
        password { 'password' }
               
        trait :defaultApprovedOrganization do
            organization { create(:defaultOrganization, :approved) }
        end

        trait :defaultUnapprovedOrganization do
            organization { create(:defaultOrganization, :rejected) }
        end

        organization { Organization.new(name: 'Default Organization', description: 'Default Organization', email: 'example@example@gmail.com', phone: '555-555-5555', primary_name: 'Default', secondary_name: 'Organization', secondary_phone: '555-555-5555') }
    end

    factory :adminUser, class: User do
        email { 'admin@example.com' }
        password { 'password' }
        role { :admin }
    end

    factory :resource_category, class: ResourceCategory do
        sequence (:name) { |n| "Test Resource Category #{n}" }
    end    

    factory :region, class: Region do
        sequence (:name) { |n| "Test Region #{n}" }
        # tickets { Ticket.new(name: 'test ticket', phone: '+15555555555', closed: false, organization: Organization.new(name: 'Default Organization', description: 'Default Organization', email: 'example@example@gmail.com', phone: '555-555-5555', primary_name: 'Default', secondary_name: 'Organization', secondary_phone: '555-555-5555'), resource_category: ResourceCategory.new(name: 'test rc')) }
    end
    
    factory :defaultTicket, class: Ticket do
        closed { false }
        phone {'+15555555555'}
        name { 'test ticket 1'}
        id { 1 }
        organization {  Organization.new(name: 'Default Organization', description: 'Default Organization', email: 'example@example@gmail.com', phone: '555-555-5555', primary_name: 'Default', secondary_name: 'Organization', secondary_phone: '555-555-5555') }
        resource_category { create(:resource_category) }
        region { create(:region) }
    end

    factory :defaultTicket2, class: Ticket do
        closed { false }
        phone {'+15555555555'}
        name { 'test ticket 2'}
        id { 2 }
        organization {  Organization.new(name: 'Default Organization', description: 'Default Organization', email: 'example@example.com', phone: '555-555-5555', primary_name: 'Default', secondary_name: 'Organization', secondary_phone: '555-555-5555') }
        resource_category { create(:resource_category) }
        region { create(:region) }
    end
end