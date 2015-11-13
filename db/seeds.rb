takeru = User.create(username: 'tkomiya', first_name: 'Takeru',
  last_name: 'Komiya', email: 'tkomiya@hotmail.com', city: 'Vancouver',
  password: 'password');

takeru.drummer = Drummer.create(background_vocals: false, double_kick: true,
  experience: 13);

takeru.guitarist = Guitarist.create(background_vocals: false, experience: 13,
  rhythm_or_lead: 'Rhythm');
