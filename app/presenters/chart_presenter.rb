class ChartPresenter

  def self.users
    @users ||= User.all
  end

  def self.services
    @services ||= Service.all
  end

  def self.users_count
    #excludes admin user
    @users_count ||= users.count - 1
  end

  def self.services_count
    @services_count ||= services.count
  end

  def self.services_by_day
    @services_by_day ||= services.group_by_day(:registered_at, 'count')
  end

  def self.services_invoice_by_month
    @services_invoice_by_month ||= services.group_by_month(:created_at, 'sum', 'cost')
  end

  def self.appliance_type_names
    @appliance_type_names ||= Appliance.joins(:type).group(:name).count
  end

  def self.new_users
    @new_users ||= User.group_by_month(:created_at, 'count')
  end
end
