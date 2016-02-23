Feature: Reserve or hold seats


  #1
  Scenario Outline: Reserve tickets for all levels when no seats are reserved or hold

    Given no seats are reserved or on hold
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And seats in level <level> are <seats>
    And reserve 10 seats in level <level>
    Then HTTP status must be 201
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And seats in level <level> are <updated_seats>
    Examples: |level      |seats|updated_seats
    |Orchestra|seats_1.txt|seats_updated_1.txt|
    |main     |seats_2.txt|seats_updated_2.txt|
    |Balconny_1|seats_3.txt|seats_updated_3.txt|
    |Balcony_2 |seats_3.txt|seats_updated_4.txt|

 #2
  Scenario Outline: Hold tickets for all levels when no seats are reserved or hold

    Given no seats are reserved or on hold
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And seats in level <level> are <seats>
    And hold 10 seats in level <level>
    Then HTTP status must be 201
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And seats in level <level> are <updated_seats>
    Examples: |level      |seats|updated_seats
    |Orchestra|seats_1.txt|seats_updated_1.txt|
    |main     |seats_2.txt|seats_updated_2.txt|
    |Balconny_1|seats_3.txt|seats_updated_3.txt|
    |Balcony_2 |seats_3.txt|seats_updated_4.txt|

#3
  Scenario Outline: Reserve tickets for all levels when some seats are reserved but no seats are on hold

    Given seats specified in file <reseved_seats> are booked in level <level>
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And result seats in level <level> are <seats>
    And reserve 10 seats in level <level>
    Then HTTP status must be 201
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And seats in level <level> are <updated_seats>

    Examples: |level      |reseved_seats|seats|updated_seats|
    |Orchestra  |seats_reserved_1.txt|seats_4.txt|seats_updated_1.txt|
    |main       |seats_reserved_2.txt|seats_5.txt|seats_updated_2.txt|
    |Balconny_1 |seats_reserved_3.txt|seats_6.txt|seats_updated_3.txt|
    |Balcony_2  |seats_reserved_4.txt|seats_7.txt|seats_updated_4.txt|

  #4
  Scenario Outline: Hold tickets for all levels when some seats are reserved but no seats are on hold

    Given seats specified in file <reseved_seats> are booked in level <level>
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And result seats in level <level> are <seats>
    And hold 10 seats in level <level>
    Then HTTP status must be 201
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And seats in level <level> are <updated_seats>

    Examples: |level      |reseved_seats|seats|updated_seats|
    |Orchestra  |seats_reserved_1.txt|seats_4.txt|seats_updated_1.txt|
    |main       |seats_reserved_2.txt|seats_5.txt|seats_updated_2.txt|
    |Balconny_1 |seats_reserved_3.txt|seats_6.txt|seats_updated_3.txt|
    |Balcony_2  |seats_reserved_4.txt|seats_7.txt|seats_updated_4.txt|

  #5
  Scenario Outline: Reserve tickets for all levels when some seats are on hold but no seats are reseved

    Given seats specified in file <hold_seats> are on hold for level <level>
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And result seats in level <level> are <seats>
    And reserve 10 seats in level <level>
    Then HTTP status must be 201
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And seats in level <level> are <updated_seats>

    Examples: |level      |hold_seats|seats|updated_seats|
    |Orchestra  |seats_hold_1.txt|seats_4.txt|seats_updated_1|
    |main       |seats_hold_2.txt|seats_5.txt|seats_updated_1|
    |Balconny_1 |seats_hold_3.txt|seats_6.txt|seats_updated_1|
    |Balcony_2  |seats_hold_4.txt|seats_7.txt|seats_updated_1|

 #6
  Scenario Outline: Hold tickets for all levels when some seats are on hold but no seats are reseved

    Given seats specified in file <hold_seats> are on hold for level <level>
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And result seats in level <level> are <seats>
    And hold 10 seats in level <level>
    Then HTTP status must be 201
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And seats in level <level> are <updated_seats>

    Examples: |level      |hold_seats|seats|updated_seats|
    |Orchestra  |seats_hold_1.txt|seats_1.txt|seats_updated_1|
    |main       |seats_hold_2.txt|seats_2.txt|seats_updated_2|
    |Balconny_1 |seats_hold_3.txt|seats_3.txt|seats_updated_3|
    |Balcony_2  |seats_hold_4.txt|seats_4.txt|seats_updated_4|

  #7
  Scenario Outline: Reserve tickets for all levels when some seats are on hold and some seats are reseved

    Given seats specified in file <hold_seats> are on hold for level <level>
    Given seats specified in file <reseved_seats> are booked in level <level>
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And result seats in level <level> are <seats>
    And reserve 10 seats in level <level>
    Then HTTP status must be 201
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And seats in level <level> are <updated_seats>

    Examples: |level      |hold_seats       |reseved_seats|seats|updated_seats|
    |Orchestra  |seats_hold_1.txt |seats_reserved_1.txt|seats_4.txt|updated_seats_4.txt|
    |main       |seats_hold_2.txt |seats_reserved_2.txt|seats_5.txt|updated_seats_5.txt|
    |Balconny_1 |seats_hold_3.txt |seats_reserved_3.txt|seats_6.txt|updated_seats_6.txt|
    |Balcony_2  |seats_hold_4.txt |seats_reserved_4.txt|seats_7.txt|updated_seats_7.txt|

 #8
  Scenario Outline: Hold tickets for all levels when some seats are on hold and some seats are reseved

    Given seats specified in file <hold_seats> are on hold for level <level>
    Given seats specified in file <reseved_seats> are booked in level <level>
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And result seats in level <level> are <seats>
    And hold 10 seats in level <level>
    Then HTTP status must be 201
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And seats in level <level> are <updated_seats>

    Examples: |level      |hold_seats       |reseved_seats|seats|updated_seats|
    |Orchestra  |seats_hold_1.txt |seats_reserved_1.txt|seats_4.txt|updated_seats_4.txt|
    |main       |seats_hold_2.txt |seats_reserved_2.txt|seats_5.txt|updated_seats_5.txt|
    |Balconny_1 |seats_hold_3.txt |seats_reserved_3.txt|seats_6.txt|updated_seats_6.txt|
    |Balcony_2  |seats_hold_4.txt |seats_reserved_4.txt|seats_7.txt|updated_seats_7.txt|



  #Negative Scenarios

  #9
  Scenario: Return error while reserving seats when total seats are not available in a row for asking level
    Given seats specified in file <reseved_seats> are booked in level <level>
    Given seats specified in file <hold_seats> are on hold for level <level>
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And result seats in level <level> are <seats>
    And reserve 50 seats in level <level>
    Then It fails with status code 400
    And error message is "Seats not available in a row"

  Examples: |level      |hold_seats       |reseved_seats|seats|
  |Orchestra  |seats_hold_1.txt |seats_reserved_1.txt|seats_4.txt|
  |main       |seats_hold_2.txt |seats_reserved_2.txt|seats_5.txt|
  |Balconny_1 |seats_hold_3.txt |seats_reserved_3.txt|seats_6.txt|
  |Balcony_2  |seats_hold_4.txt |seats_reserved_4.txt|seats_7.txt|


    #10
  Scenario: Return error while holding seats when total seats are not available in a row for asking level
    Given seats specified in file <reseved_seats> are booked in level <level>
    Given seats specified in file <hold_seats> are on hold for level <level>
    When get number of seats available in level <level>
    Then It succeeds with status code 200
    And result seats in level <level> are <seats>
    And hold 50 seats in level <level>
    Then It fails with status code 400
    And error message is "Seats not available in a row"

  Examples: |level      |hold_seats       |reseved_seats|seats|
  |Orchestra  |seats_hold_1.txt |seats_reserved_1.txt|seats_4.txt|
  |main       |seats_hold_2.txt |seats_reserved_2.txt|seats_5.txt|
  |Balconny_1 |seats_hold_3.txt |seats_reserved_3.txt|seats_6.txt|
  |Balcony_2  |seats_hold_4.txt |seats_reserved_4.txt|seats_7.txt|
