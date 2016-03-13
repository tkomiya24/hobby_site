ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # MySQL and PostgreSQL
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  # ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

takeru = User.create(username: 'tkomiya24', city: 'Vancouver', password: 'password',
                     password_confirmation: 'password')
takeru.musicians << Guitarist.new(background_vocals: false, experience: 13,
                                  rhythm_or_lead: 'Rhythm', proficiency: 'Intermmediate')
takeru.musicians << Drummer.new(background_vocals: true, experience: 15, double_kick: true,
                                proficiency: 'Advanced')

jared = User.create(username: 'jz123', city: 'Vancouver', password: 'password',
                    password_confirmation: 'password')
jared.musicians << Bassist.new(background_vocals: true, experience: 13, proficiency: 'Advanced')

nick = User.create(username: 'nlan23', city: 'Vancouver', password: 'password',
                   password_confirmation: 'password')
nick.musicians << Guitarist.new(background_vocals: true, experience: 13,
                                rhythm_or_lead: 'Rhythm', proficiency: 'Advanced')
