FactoryBot.define do

    sequence :emailS do |n|
        "example#{n}@example.com"
    end

    sequence :nameS do |n|
        "name#{n}"
    end

end