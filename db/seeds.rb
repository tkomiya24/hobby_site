ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # MySQL and PostgreSQL
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  # ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

takeru = User.create(username: 'tkomiya', first_name: 'Takeru',
                     last_name: 'Komiya', email: 'tkomiya@fake.com', city: 'Vancouver',
                     password: 'password')

takeru.musicians << Guitarist.new(background_vocals: false, experience: 13,
                                  rhythm_or_lead: 'Rhythm')

jared = User.create(username: 'jzecchel', first_name: 'Jared',
                    last_name: 'Zecchel', email: 'jzecchel@fake.com', city: 'Vancouver',
                    password: 'password')

jared.musicians << Bassist.new(background_vocals: true, experience: 13)
