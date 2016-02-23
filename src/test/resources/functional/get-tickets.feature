Feature: Get tickets for the show for different condition


  #1
  Scenario Outline: Get number of tickets for all levels when no seats are reserved or hold

    Given no seats are reserved or on hold
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And seats in level <level> are <seats>

    Examples: |level      |seats|
              |Orchestra|seats_1.txt|
              |main     |seats_2.txt|
              |Balconny_1|seats_3.txt|
              |Balcony_2 |seats_3.txt|

#2
  Scenario Outline: Get number of tickets for all levels when some seats are reserved but no seats are on hold

    Given seats specified in file <reseved_seats> are booked in level <level>
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And result seats in level <level> are <seats>

    Examples: |level      |reseved_seats|seats|
              |Orchestra  |seats_reserved_1.txt|seats_4.txt|
              |main       |seats_reserved_2.txt|seats_5.txt|
              |Balconny_1 |seats_reserved_3.txt|seats_6.txt|
              |Balcony_2  |seats_reserved_4.txt|seats_7.txt|

  #3
  Scenario Outline: Get number of tickets for all levels when some seats are on hold but no seats are reseved

    Given seats specified in file <hold_seats> are on hold for level <level>
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And result seats in level <level> are <seats>

    Examples: |level      |hold_seats|seats|
              |Orchestra  |seats_hold_1.txt|seats_4.txt|
              |main       |seats_hold_2.txt|seats_5.txt|
              |Balconny_1 |seats_hold_3.txt|seats_6.txt|
              |Balcony_2  |seats_hold_4.txt|seats_7.txt|

  #4
  Scenario Outline: Get number of tickets for all levels when some seats are on hold and some seats are reseved

    Given seats specified in file <hold_seats> are on hold for level <level>
    Given seats specified in file <reseved_seats> are booked in level <level>
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And result seats in level <level> are <seats>

    Examples: |level      |hold_seats       |reseved_seats|seats|
              |Orchestra  |seats_hold_1.txt |seats_reserved_1.txt|seats_4.txt|
              |main       |seats_hold_2.txt |seats_reserved_2.txt|seats_5.txt|
              |Balconny_1 |seats_hold_3.txt |seats_reserved_3.txt|seats_6.txt|
              |Balcony_2  |seats_hold_4.txt |seats_reserved_4.txt|seats_7.txt|


  #5
  Scenario Outline: Get number of tickets for different criteria with limits set to number of tickets needed - When mno seats are reserved or on hold

    Given no seats are reserved or on hold
    When get seats sorted by <criteria> with limit 20
    Then It succeeds with status code 200
    And result seats in level <level>> are <seats>

    Examples:
    |criteria             |level      |seats|
    |best_available_seats |Orchestra  |A1,...A20|
    |economy_seats        |Balconny_1 |A1...A20|
    |low_price            |Balconny2_1|O81...O100  |

 #6
  Scenario Outline: Get number of tickets for different criteria with limits set to number of tickets needed - When few seats are reseved

    Given seats specified in file <reseved_seats> are booked in level <level>
    When get seats sorted by <criteria> with limit 20
    Then It succeeds with status code 200
    And result seats in level <level>> are <seats>

    Examples:
      |reseved_seats       |criteria             |level      |seats|
      |seats_reserved_1.txt|best_available_seats |Orchestra  |A1,...A20|
      |seats_reserved_2.txt|economy_seats        |Balconny_1 |A1...A20|
      |seats_reserved_3.txt|low_price            |Balconny2_1|O81...O100  |

 #7
  Scenario Outline: Get number of tickets for different criteria with limits set to number of tickets needed - When few seats are on hold

    Given seats specified in file <hold_seats> are on hold for level <level>
    When get seats sorted by <criteria> with limit 20
    Then It succeeds with status code 200
    And result seats in level <level> are <seats>

    Examples:
      |hold_seats       |criteria             |level      |seats|
      |seats_hold_1.txt|best_available_seats |Orchestra  |A1,...A20|
      |seats_hold_2.txt|economy_seats        |Balconny_1 |A1...A20|
      |seats_hold_3.txt|low_price            |Balconny2_1|O81...O100  |


  #Negative Scenarios
 #8
 Scenario: Return error when when level does not exists
   When get number of seats available in level 'random'
   Then It fails with status code 404
   And error message is "level does not exists"

 #9
  Scenario: Return error when number of seats are greater than asking number of seats
    When get seats sorted by <criteria> with limit 200
    Then It fails with status code 400
    And error message is "Asking number of seats are greater than available seats"
