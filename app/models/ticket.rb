#   Ticket
#   Represents an individual request by a user for assistance, which is fulfilled by an Organization
#   Can belong to a Region, Resource Category, or be captured by an approved Organization
#   When a user submits a request for assistance, it generates an open Ticket
#   After an Organization captures and fulfils the request, the Ticket is closed

class Ticket < ApplicationRecord

  belongs_to :region
  belongs_to :resource_category
  belongs_to :organization, optional: true

  validates_presence_of :name, :phone, :region_id, :resource_category_id
  validates_length_of :name, minimum: 1, maximum: 255, on: :create
  validates_length_of :description, maximum: 1020, on: :create
  validates_plausible_phone :phone

  scope :open, -> () { where closed: false, organization_id: nil }
  scope :closed, -> () { where closed: true }
  scope :all_organization, -> () { where(closed: false).where.not(organization_id: nil) }
  scope :organization, -> (organization_id) { where(organization_id: organization_id, closed: false) }
  scope :closed_organization, -> (organization_id) { where(organization_id: organization_id, closed: true) }
  scope :region, -> (region_id) { where(region_id: region_id) }
  scope :resource_category, -> (resource_category_id) { where(resource_category_id: resource_category_id) }


  def open?
    !closed
  end

  def captured?
    organization.present?
  end

  def to_s
    "Ticket #{id}"
  end

end
