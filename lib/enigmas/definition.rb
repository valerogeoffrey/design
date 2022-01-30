module Enigmas
  def self.fetch_enigmas_definition
    [
      {
        :question => '> Combien font: 1 + 1 ?',
        :response => '2',
        :type => :choice,
        :choices => ['1', '2', '6', '3']
      },
      {
        :question => '> Combien font: 1 + 1 ? ',
        :response => '2',
        :type => :free
      },
      {
        :question => '> Combien font: 2 + 2 ?',
        :response => '4',
        :type => :choice,
        :choices => ['2', '4', '6', '8']
      },
      {
        :question => '> Combien font: 4 + 2 ?',
        :response => '6',
        :type => :choice,
        :choices => ['2', '4', '6', '8']
      },
      {
        :question => '> Combien font: 4 x 2 ?',
        :response => '8',
        :type => :choice,
        :choices => ['2', '4', '6', '8']
      }
    ]
  end
end
