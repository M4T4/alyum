# frozen_string_literal: true

module UserHelper
  def blank_name?(user)
    user.first_name.blank? || user.last_name.blank?
  end

  def full_name(user)
    return 'Sin nombre' if blank_name?(user)

    [user.first_name, user.last_name].join(' ')
  end

  def name_initials(user)
    return '' if blank_name?(user)

    user.first_name.first.capitalize + user.last_name.first.capitalize
  end

  def user_first_name(user)
    return user.email if user.first_name.blank?

    user.first_name
  end
end
