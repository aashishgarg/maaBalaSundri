class Organization < ApplicationRecord
  store :social_links, accessors: [:facebook, :twitter, :linkedin, :google_plus], coder: Hash
end