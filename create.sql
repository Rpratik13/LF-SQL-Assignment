CREATE SCHEMA airline;

CREATE TABLE airline.passenger(
  name VARCHAR(100),
  address       VARCHAR(100),
  ref_no        VARCHAR(10) UNIQUE,
  sex           VARCHAR(10),
  nationality   VARCHAR(20),
  dob           DATE,
  passport_no   INT,
  PRIMARY KEY(passport_no)
);

CREATE TABLE airline.flight(
  flight_no    VARCHAR(20),
  airline_name VARCHAR(50),
  flight_date  DATE,
  PRIMARY KEY(flight_no)
);

CREATE TABLE airline.flight_destination(
  flight_no      VARCHAR(20),
  location       VARCHAR(50),
  departure_time TIME,
  arrival_time TIME,
  FOREIGN KEY(flight_no) 
    REFERENCES airline.flight(flight_no)
);

CREATE TABLE airline.flight_passenger(
  passenger_ref_no VARCHAR(10),
  flight_no        VARCHAR(20), 
  baggage_check    BOOLEAN,
  check_in         BOOLEAN,
  FOREIGN KEY(passenger_ref_no)
    REFERENCES airline.passenger(ref_no),
  FOREIGN KEY(flight_no)
    REFERENCES airline.flight(flight_no)
);

CREATE TABLE airline.baggage(
  passenger_ref_no VARCHAR(10),
  baggage_label_no VARCHAR(10),
  FOREIGN KEY(passenger_ref_no)
    REFERENCES airline.passenger(ref_no)
);

CREATE TABLE airline.private_flight(
  aircraft_no    VARCHAR(10) NOT NULL,
  aircraft_type  VARCHAR(30),
  pilot          VARCHAR(30),
  departure_date DATE NOT NULL,
  departure_time TIME NOT NULL,
  destination    VARCHAR(30),
  PRIMARY KEY(aircraft_no, departure_date, departure_time)
);

CREATE TABLE airline.freight_flight(
  flight_no      VARCHAR(10),
  airline        VARCHAR(20),
  destination    VARCHAR(30),
  departure_date DATE,
  departure_time TIME,
  arrival_time   TIME,
  PRIMARY KEY(flight_no)
);

CREATE TABLE airline.freight_type(
  flight_no VARCHAR(10),
  type VARCHAR(50),
  FOREIGN KEY(flight_no)
    REFERENCES airline.freight_flight(flight_no)
);