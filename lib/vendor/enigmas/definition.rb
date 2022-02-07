# frozen_string_literal: true

module Enigmas
  def self.fetch_enigmas_definition
    [
      {
        question: '> How much is: 1 + 1 ?',
        response: '2',
        type: :choice,
        choices: ['1', '2', '6', '3']
      },
      {
        question: '> How much is: 4 + 1 ? ',
        response: '5',
        type: :free
      },
      {
        question: '> How much is: 2 + 2 ?',
        response: '4',
        type: :choice,
        choices: ['2', '4', '6', '8']
      },
      {
        question: '> How much is: 4 + 2 ?',
        response: '6',
        type: :choice,
        choices: ['2', '4', '6', '8']
      },
      {
        question: '> How much is: 4 x 2 ?',
        response: '8',
        type: :choice,
        choices: ['2', '4', '6', '8']
      }
    ]
  end
end
