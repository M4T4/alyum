# frozen_string_literal: true

class Language < ApplicationRecord
  before_save :capitalize

   def capitalize
      self.name.capitalize!
   end
end
