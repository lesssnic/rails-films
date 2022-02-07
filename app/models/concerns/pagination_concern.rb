module PaginationConcern
  extend ActiveSupport::Concern

  included do
    scope :pagination, (proc do |page, per_page, order = "id"|
                          page ||= 1
                          per_page ||= 5
                          order(order).page(page).per(per_page)
                        end)
  end
end
