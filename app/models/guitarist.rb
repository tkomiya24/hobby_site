class Guitarist < ActiveRecord::Base
  validates :rhythm_or_lead, inclusion: { in: %w(Rhythm Lead Both) }
  acts_as :musician

  def type_summary
    case rhythm_or_lead
    when 'Rhythm'
      'Plays rhythm guitar'
    when 'Lead'
      'Plays lead guitar'
    when 'Both'
      'Plays both lead and rhythm guitar'
    end
  end
end
