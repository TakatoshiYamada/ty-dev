class ApplicationRecord < ActiveRecord::Base
  #　単一のDBを扱う場合
  self.abstract_class = true

  # self.abstract_class = trueを内包している
  # 複数DBを扱う場合
  # primary_abstract_class
end
