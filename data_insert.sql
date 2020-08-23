INSERT INTO airline.passenger (name, address, ref_no, sex, nationality, dob, passport_no)
  VALUES ('Lionel Smart', '40 Underhill Road, London, SE12 UB4', 'P9200', 'Male', 'British', '2071-08-09', 34343430),
         ('Michelle Sanders', '30 High Street, Colchester, Essex, CO1 6Y', 'P9908', 'Female', 'British', '2066-12-07', 98232322),
         ('Pretti Patel', '88 May Street, Saxmunden, Suffolk, SX1 8TT', 'P8675', 'Female', 'British', '2080-01-06', 85423111),
         ('Sadiq Khan', '2 Jamaica Road Southwark SE1, 9C', 'P8711', 'Male', 'French', '2078-03-07', 42342323), 
         ('Chaz Smith', '56 Ireton Towers, West, Street, Southwark, SE1 Y4', 'P7650', 'Male', 'Irish', '2077-09-15', 67891233)
;

INSERT INTO airline.flight (flight_no, airline_name, flight_date)
  VALUES ('LA3456', 'Lion Air', '2016-03-01'),
         ('LA3467', 'Lion Air', '2016-03-03'),
         ('RA877', 'Rose Air', '2016-03-03'),
         ('RA999', 'Rose Air', '2016-04-21'),
         ('GF456', 'Gateway Flights', '2016-04-22')
;

INSERT INTO airline.flight_destination (flight_no, location, departure_time, arrival_time)
  VALUES ('LA3456', 'Liverpool John Lennon', '09:30:00', '10:30:00'),
         ('LA3456', 'Glasgow', '10:50:00', '11:50:00'),
         ('LA3467', 'Glasgow', '17:00', '18:00'),
         ('LA3467', 'Highland Airport', '17:00', '18:00'),
         ('RA877', 'Shannon', '18:00', '20:00'),
         ('RA999', 'Liverpool John Lennon', '10:15', '11:15'),
         ('GF456', 'Le Touquet', '11:00', '11:45')
;

INSERT INTO airline.flight_passenger (passenger_ref_no, flight_no, baggage_check, check_in)
  VALUES ('P9200', 'LA3456', true, false),
         ('P9908', 'LA3456', true, true),
         ('P8675', 'LA3456', false, false),
         ('P8711', 'LA3456', false, false),
         ('P7650', 'LA3456', true, true)
;

INSERT INTO airline.baggage (passenger_ref_no, baggage_label_no)
  VALUES ('P9200', 'B980'),
         ('P9200', 'B981'),
         ('P9908', 'B982'),
         ('P7650', 'B983'),
         ('P7650', 'B984')
;

INSERT INTO airline.private_flight (aircraft_no, aircraft_type, pilot, departure_date, departure_time, destination)
  VALUES ('C786', 'Cesna 120', 'Jane Henderson', '2016-01-01', '9:23:00', 'Le Touquet'),
         ('C900', 'Cesna 200', 'Alice Sprigg', '2016-01-03', '9:18:00', 'Le Touquet'),
         ('P090', 'Piper', 'Dave Carr', '2016-03-01', '10:27:00', 'Lydd'),
         ('BB987', 'Beechcraft Baron', 'Morris Beckman', '2016-03-02', '16:00:00', 'Shannon')
;

INSERT INTO airline.freight_flight (flight_no, airline, destination, departure_date, departure_time, arrival_time)
  VALUES ('TFA876', 'Tigress Freight Air', 'Shannon', '2016-03-02', '9:30:00', '11:30:00'),
         ('MA112', 'Madrigal Air', 'Ramsey', '2016-03-05', '17:00:00', '18:00:00'),
         ('SA123', 'Sacks Air', 'Shannon', '2016-03-13', '18:00:00', '20:00:00'),
         ('SA872', 'Sacks Air', 'Manchester', '2016-03-22', '10:15:00', '11:00:00'),
         ('GF509', 'Gateway Flights', 'Manchester', '2016-04-22', '11:00:00', '11:45:00')
;

INSERT INTO airline.freight_type (flight_no, type)
  VALUES ('TFA876', 'Medical Supplies'),
         ('TFA876', 'Documents'),
         ('MA112', 'Documents'),
         ('SA123', 'Medical Supplies'),
         ('SA872', 'Office Equipment Supplies'),
         ('SA872', 'Documents'),
         ('GF509', 'Office Equipment Supplies')
;