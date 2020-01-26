class AddFullTextSearchToAdvertisements < ActiveRecord::Migration[6.0]
  def up
    add_column :advertisements, :tsv, 'tsvector'

    execute <<-SQL
      CREATE INDEX ads_tsv_index
      ON advertisements
      USING gin(tsv);
    SQL

    execute <<-SQL
      CREATE OR REPLACE FUNCTION ads_ts_trigger_function() RETURNS TRIGGER AS $$
      BEGIN
        new.tsv := to_tsvector(new.title) || to_tsvector(new.content);
        return new;
      END
      $$ language plpgsql;

      DROP TRIGGER IF EXISTS ads_ts_trigger
      ON advertisements;
      CREATE TRIGGER ads_ts_trigger
      BEFORE INSERT OR UPDATE
      ON advertisements
      FOR EACH ROW 
      EXECUTE PROCEDURE ads_ts_trigger_function();
    SQL
  end

  def down
    remove_column :advertisements, :tsv
    execute <<-SQL
      DROP TRIGGER IF EXISTS ads_ts_trigger on advertisements;
    SQL
  end
end
