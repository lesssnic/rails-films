module PaginationConcern
  extend ActiveSupport::Concern

  included do
    scope :pagination, (proc do |page, per_page, order = "id"|
      page ||= 1
      per_page ||= 5
      order(order).page(page).per(per_page)
    end)

    scope :infinity_scroll, (proc do |created_at, per_page, order = "created_at DESC"|
      created_at ||= Time.now
      per_page ||= 5
      where("created_at < ?", created_at).order(order).page.per(per_page)
    end)
  end
end
