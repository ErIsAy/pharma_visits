#Custom Predicate for Ransack search date >= and <=  soluction
Ransack.configure do |config|
    config.add_predicate 'date_lequals',
      arel_predicate: 'lteq',
      formatter: proc { |v| v.to_date },
      type: :string
  
    config.add_predicate 'date_gequals',
      arel_predicate: 'gteq',
      formatter: proc { |k| k.to_date },
      type: :string
  
  
  end