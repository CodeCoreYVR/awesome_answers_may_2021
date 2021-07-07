class RemoveLikeCountFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :like_count, :integer
  end
end

#Alternatively, you could do rails db:rollback
#If you want to rollback to a specific migration, you can do:
# rails db:rollback STEP=2 (which would rollback 2 migrations, for example)

#You can find more information about migrations here: http://edgeguides.rubyonrails.org/active_record_migrations.html

