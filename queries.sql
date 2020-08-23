-- All passengers for flight LA3456
SELECT passenger.name, passenger.ref_no, passenger.sex, passenger.nationality, 
       passenger.dob, passenger.passport_no, flight_passenger.flight_no 
  FROM airline.passenger AS passenger
    INNER JOIN airline.flight_passenger AS flight_passenger
      ON passenger.ref_no = flight_passenger.passenger_ref_no
         AND flight_passenger.flight_no = 'LA3456'
;

-- All flights carrying medical supplies
SELECT freight.*, freight_type.type
  FROM airline.freight_flight as freight
    INNER JOIN airline.freight_type AS freight_type
      ON freight.flight_no = freight_type.flight_no
         AND freight_type.type = 'Medical Supplies'
;

-- All passengers who have not checked in baggage for flight LA3456
SELECT passenger.name, passenger.ref_no, passenger.sex, passenger.nationality, passenger.dob, passenger.passport_no, flight_passenger.flight_no 
  FROM airline.passenger AS passenger
    INNER JOIN airline.flight_passenger AS flight_passenger
      ON passenger.ref_no = flight_passenger.passenger_ref_no
         AND flight_passenger.flight_no = 'LA3456'
         AND flight_passenger.baggage_check = false
;

-- All flights going to Shannon
SELECT flight_no, location FROM
  (SELECT flight.flight_no, destination.location
    FROM airline.flight AS flight
      INNER JOIN airline.flight_destination AS destination
        ON flight.flight_no = destination.flight_no
    UNION ALL
      SELECT private_flight.aircraft_no, private_flight.destination 
        FROM airline.private_flight AS private_flight
    UNION ALL
      SELECT freight_flight.flight_no, freight_flight.destination 
        FROM airline.freight_flight AS freight_flight
  ) AS flights
    WHERE flights.location = 'Shannon'
;

-- No. of flights in March
SELECT count(*) AS march_flights FROM 
  (SELECT flight_date FROM airline.flight
    UNION ALL
      SELECT departure_date FROM airline.private_flight
    UNION ALL
      SELECT departure_date FROM airline.freight_flight
  ) AS flights
    WHERE flights.flight_date BETWEEN '2016-03-01' AND '2016-03-31'
;

-- Update GF456 departure time
UPDATE airline.flight_destination
  SET departure_time = '18:00:00',
      arrival_time   = '18:45:00'
    WHERE flight_no = 'GF456'
;

-- Update flight C786 pilot
UPDATE airline.private_flight
  SET pilot = 'Paul Stow'
    WHERE aircraft_no = 'C786'
;

-- Update all flights in January 2016 and destination Le Touquet
BEGIN TRANSACTION;

UPDATE airline.flight_destination
  SET location = 'Lydd'
    FROM airline.flight 
      WHERE airline.flight.flight_no = airline.flight_destination.flight_no
          AND airline.flight.flight_date BETWEEN '2016-01-01' AND '2016-01-31'
          AND airline.flight_destination.location = 'Le Touquet'
;

UPDATE airline.private_flight
  SET destination = 'Lydd'
    WHERE destination = 'Le Touquet'
          AND departure_date BETWEEN '2016-01-01' AND '2016-01-31'
;

UPDATE airline.freight_flight
  SET destination = 'Lydd'
    WHERE destination = 'Le Touquet'
          AND departure_date BETWEEN '2016-01-01' AND '2016-01-31'
;
COMMIT;

-- Update nationality of Chaz Smith
UPDATE airline.passenger
  SET nationality = 'French'
    WHERE name = 'Chaz Smith'
;

-- Delete private flights for date 03 January 016
DELETE FROM airline.private_flight
  WHERE departure_date = '2016-01-03';