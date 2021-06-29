class AddKindToDiaries < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE
        diary_kind
      AS ENUM
        ('public', 'private');

      ALTER TABLE
        diaries
      ADD COLUMN
        kind diary_kind
      NOT NULL;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE
        diaries
      DROP COLUMN
        kind;

      DROP TYPE
        diary_kind;
    SQL
  end
end
