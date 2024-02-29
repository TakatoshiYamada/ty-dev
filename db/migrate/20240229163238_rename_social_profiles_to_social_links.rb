class RenameSocialProfilesToSocialLinks < ActiveRecord::Migration[7.0]
  def change
    rename_table :social_profiles, :social_links
  end
end
