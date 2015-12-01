CREATE SCHEMA RAZVOJ;

CREATE TABLE RAZVOJ.OSOBA
(
id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
prezime VARCHAR(25) NOT NULL,
ime VARCHAR(25) NOT NULL,
oib VARCHAR(11) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE RAZVOJ.RACUN
(
id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
vlasnik_id INTEGER NOT NULL,
stanje DECIMAL(15,2) NOT NULL,
oznaka VARCHAR(20) NOT NULL,
valuta VARCHAR(3) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (vlasnik_id) REFERENCES RAZVOJ.OSOBA(id)
);

CREATE TABLE RAZVOJ.TRANSAKCIJA
(
id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
polazni_racun_id INTEGER NOT NULL,
odlazni_racun_id INTEGER NOT NULL,
iznos DECIMAL(15,2) NOT NULL,
valuta VARCHAR(3) NOT NULL,
datum DATE NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (polazni_racun_id) REFERENCES RAZVOJ.RACUN(id),
FOREIGN KEY (odlazni_racun_id) REFERENCES RAZVOJ.RACUN(id)
); 
