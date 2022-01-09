

--drop table curselev;
--drop table sediucurs;
--drop table locatie;
--drop table elev;
--drop table grupa;
--drop table coordonator;
--drop table curs;
--drop table profesor;



CREATE TABLE locatie (
    id_locatie   NUMBER(8) NOT NULL,
    strada       VARCHAR2(30),
    numar        NUMBER(8),
    cod_postal   VARCHAR2(6),
    PRIMARY KEY(id_locatie));
    
   
CREATE TABLE profesor (
    id_prof   NUMBER(8) NOT NULL,
    nume      VARCHAR2(30),
    prenume   VARCHAR2(30),
    salariu   NUMBER(8),
    PRIMARY KEY ( id_prof )
);


CREATE TABLE coordonator (
    id_coord   NUMBER(8) NOT NULL,
    nume       VARCHAR2(30),
    prenume    VARCHAR2(30),
    PRIMARY KEY(id_coord)
);



CREATE TABLE grupa (
    id_grupa          NUMBER(8) NOT NULL,
    id_coord          NUMBER(8),
    data_infiintare   DATE,
    PRIMARY KEY ( id_grupa ),
    FOREIGN KEY ( id_coord ) REFERENCES coordonator(id_coord) ON DELETE SET NULL
);


CREATE TABLE elev (
    id_elev    NUMBER(8) NOT NULL,
    nume       VARCHAR2(20),
    prenume    VARCHAR2(20),
    clasa      NUMBER(3),
    id_grupa   NUMBER(8),
    PRIMARY KEY ( id_elev ),
    FOREIGN KEY ( id_grupa )
        REFERENCES grupa ( id_grupa ) ON DELETE SET NULL
);



CREATE TABLE curs (
    id_curs    NUMBER(8) NOT NULL,
    id_prof    NUMBER(8),
    denumire   VARCHAR2(30),
    durata     VARCHAR2(10),
    ziua       VARCHAR2(10),
    ora        VARCHAR(6),
    PRIMARY KEY ( id_curs ),
    FOREIGN KEY ( id_prof )
        REFERENCES profesor ( id_prof ) ON DELETE SET NULL
);


CREATE TABLE CURSELEV(
                      id_curs number(8),
                      id_elev number(8),
                      FOREIGN KEY(id_curs) REFERENCES CURS(id_curs) ON DELETE CASCADE,
                      FOREIGN KEY(id_elev) REFERENCES ELEV(id_elev) ON DELETE CASCADE,                 
                      CONSTRAINT id_curselev PRIMARY KEY (id_elev, id_curs));



CREATE TABLE SEDIUCURS( id_curs number(8) NOT NULL,
                        id_locatie number(8) NOT NULL,
                        denumire_sediu varchar2(20),
                        FOREIGN KEY(id_curs) REFERENCES CURS(id_curs)ON DELETE CASCADE,
                        FOREIGN KEY(id_locatie) REFERENCES LOCATIE(id_locatie)ON DELETE CASCADE,
                        CONSTRAINT id_curslocatie PRIMARY KEY (id_curs, id_locatie));


insert into profesor(id_prof, nume, prenume, salariu)
values(10,'Atudorei', 'Gabriela', 2000);

insert into profesor(id_prof, nume, prenume, salariu)
values(11,'Alexei', 'Mihai', 2100);

insert into profesor(id_prof, nume, prenume, salariu)
values(12,'Filimon', 'Andrei', 2000);

insert into profesor(id_prof, nume, prenume, salariu)
values(13,'Stingaciu', 'Razvan', 1900);

insert into profesor(id_prof, nume, prenume, salariu)
values(14,'Hriscu', 'Mirela', 2100);

insert into profesor(id_prof, nume, prenume, salariu)
values(16,'Cojocaru', 'Cristian', 2000);

insert into profesor(id_prof, nume, prenume, salariu)
values(17,'Ciulin', 'Virgil', 2000);

insert into profesor(id_prof, nume, prenume, salariu)
values(18,'Cizmasu', 'Luiza', 2000);



INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(101, 10, 'Limba si literatura romana', '2 ore', 'Marti', '14:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(102, 10, 'Limba si literatura romana', '2 ore', 'Miercuri', '14:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(103, 10, 'Limba si literatura romana', '2 ore', 'Vineri', '08:00');



INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(104, 11, 'Matematica', '2 ore', 'Luni', '12:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(105, 11, 'Matematica', '2 ore', 'Luni', '14:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(106, 11,  'Matematica', '2 ore', 'Marti', '10:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(107, 11, 'Matematica', '2 ore', 'Joi', '14:00');


INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(108, 12, 'Limba si literatura romana', '2 ore', 'Marti', '08:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(109, 12, 'Limba si literatura romana', '2 ore', 'Vineri', '14:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(110, 12, 'Limba si literatura romana', '2 ore', 'Joi', '12:00');


INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(114, 13, 'Engleza', '1 ora', 'Marti', '10:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(115, 13, 'Engleza', '2 ore', 'Vineri', '12:00');


INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(117, 14, 'Limba germana', '2 ore', 'Luni', '10:00');



INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(124, 16, 'Fizica', '3 ore', 'Luni', '13:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(125, 16, 'Fizica', '1 ora', 'Miercuri', '10:00');


INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(128, 17, 'Chimie', '2 ore', 'Vineri', '13:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(129, 17, 'Chimie', '2 ora', 'Miercuri', '10:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(130, 17, 'Chimie', '2 ore', 'Luni', '14:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(132, 18, 'Matematica', '2 ore', 'Vineri', '09:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(133, 18, 'Matematica', '3 ora', 'Miercuri', '14:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(134, 18, 'Matematica', '2 ore', 'Joi', '08:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(135, 18, 'Matematica', '2 ore', 'Joi', '12:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(136, 18, 'Matematica', '2 ore', 'Luni', '10:00');

INSERT INTO CURS(id_curs, id_prof, denumire, durata, ziua, ora)
VALUES(137, 18, 'Matematica', '2 ore', 'Luni', '14:00');





INSERT INTO LOCATIE(id_locatie, strada, numar, cod_postal)
VALUES(1, 'str. Theodor Pallady', 10, '023365');

INSERT INTO LOCATIE(id_locatie, strada, numar, cod_postal)
VALUES(2, 'str. Lujerului', 13, '221365');

INSERT INTO LOCATIE(id_locatie, strada, numar, cod_postal)
VALUES(3, 'str. Calea Victoriei', 46, '421321');

INSERT INTO LOCATIE(id_locatie, strada, numar, cod_postal)
VALUES(4, 'str. Mihai Viteazul', 10, '023365');


INSERT INTO COORDONATOR(id_coord, nume, prenume)
VALUES (1, 'Ababei', 'Alexandru');

INSERT INTO COORDONATOR(id_coord, nume, prenume)
VALUES (2, 'Simion', 'Andreea');

INSERT INTO COORDONATOR(id_coord, nume, prenume)
VALUES (3, 'Macovei', 'Ana');

INSERT INTO COORDONATOR(id_coord, nume, prenume)
VALUES (4, 'Caldarusa', 'Robert');

INSERT INTO COORDONATOR(id_coord, nume, prenume)
VALUES (5, 'Sever', 'Andrei');

INSERT INTO COORDONATOR(id_coord, nume, prenume)
VALUES (6, 'Mihoci', 'Gabriel');

INSERT INTO COORDONATOR(id_coord, nume, prenume)
VALUES (7, 'Stetcu', 'Paul');

INSERT INTO COORDONATOR(id_coord, nume, prenume)
VALUES (8, 'Doroftei', 'Alin');



INSERT INTO GRUPA(id_grupa, id_coord, data_infiintare)
VALUES(1, 7, '12-09-2019');

INSERT INTO GRUPA(id_grupa, id_coord, data_infiintare)
VALUES(2, 4, '15-09-2020');

INSERT INTO GRUPA(id_grupa, id_coord, data_infiintare)
VALUES(3, 3, '12-09-2020');

INSERT INTO GRUPA(id_grupa, id_coord, data_infiintare)
VALUES(4, 1, '04-12-2020');

INSERT INTO GRUPA(id_grupa, id_coord, data_infiintare)
VALUES(5, 7, '07-10-2020');

INSERT INTO GRUPA(id_grupa, id_coord, data_infiintare)
VALUES(6, 2, '03-06-2020');

INSERT INTO GRUPA(id_grupa, id_coord, data_infiintare)
VALUES(7, 5, '18-12-2020');

INSERT INTO GRUPA(id_grupa, id_coord, data_infiintare)
VALUES(8, 6, '07-01-2021');

INSERT INTO GRUPA(id_grupa, id_coord, data_infiintare)
VALUES(9, 8, '24-10-2020');

INSERT INTO GRUPA(id_grupa, id_coord, data_infiintare)
VALUES(10, 5, '24-11-2020');

INSERT INTO GRUPA(id_grupa, id_coord, data_infiintare)
VALUES(11, 1, '13-07-2020');



INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(1, 'Lupu', 'Mihai', 7, 3);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(2, 'Melinte', 'Ionut', 7, 3);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(3, 'Samoila', 'Andrei', 7, 3);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(4, 'Istrate', 'Andreea', 7, 3);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(5, 'Vintu', 'Alexandru', 7, 3);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(6, 'Nita', 'Adelina', 7, 3);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(7, 'Tanase', 'Daniel', 7, 3);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(8, 'Andrusca', 'Robert', 7, 3);



INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(9, 'Petru', 'Luca', 7, 4);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(10, 'Mihnea', 'Radu', 7, 4);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(11, 'Tanasa', 'Roxana', 7, 4);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(12, 'Dascalu', 'Cosmin', 7, 4);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(13, 'Maxim', 'Tiberiu', 7, 4);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(14, 'Darie', 'Stefan', 7, 4);



INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(15, 'Aprodu', 'Lucian', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(16, 'Pandele', 'Raluca', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(17, 'Turcu', 'Sabina', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(18, 'Tiron', 'Iulia', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(19, 'Maxim', 'Andrei', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(20, 'Dumitru', 'Silviu', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(21, 'Drelciuc', 'Razvan', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(22, 'Dragnea', 'Cosmin', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(23, 'Avadanei', 'Marian', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(24, 'Bontas', 'Andrei', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(25, 'Burechita', 'Cosmin', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(26, 'Filaret', 'Stefan', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(27, 'Ursu', 'Calin', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(28, 'Vatavu', 'Tudor', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(29, 'Vieru', 'Stefania', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(30, 'Vanea', 'Mariana', 6, 2);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(31, 'Stoica', 'Violeta', 6, 2);







INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(32, 'Budeanu', 'Dana', 5, 1);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(33, 'Bulai', 'Elena', 5, 1);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(34, 'Istrate', 'Rodica', 5, 1);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(35, 'Culita', 'Mihai', 5, 1);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(36, 'Balan', 'Eugen', 5, 1);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(37, 'Balan', 'Daniel', 5, 1);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(38, 'Moraru', 'Alina', 5, 1);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(39, 'Pat', 'Daniela', 5, 1);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(40, 'Miclescu', 'Cristina', 5, 1);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(41, 'Popescu', 'Romeo', 5, 1);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(42, 'Pop', 'Ion', 5, 1);



INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(43, 'Nitoi', 'Ionela', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(44, 'Namila', 'Costel', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(45, 'Manea', 'Andrei', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(46, 'Todor', 'Claudiu', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(47, 'Melinte', 'Ioana', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(48, 'Bulgaru', 'Carla', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(49, 'Paval', 'Cristina', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(50, 'Pana', 'Julia', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(51, 'Dumitrescu', 'Corina', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(52, 'Cintu', 'Iulian', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(53, 'Hora', 'Iustin', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(54, 'Panaite', 'Aurelia', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(55, 'Deliu', 'Maria', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(56, 'Sandila', 'Monica', 8, 5);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(57, 'Moldovianu', 'Ionut', 8, 5);



INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(58, 'Amare', 'Cosmin', 6, 6);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(59, 'Alexei', 'Raul', 6, 6);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(60, 'Dinu', 'Paula', 6, 6);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(61, 'Doroftei', 'Cosmina', 6, 6);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(62, 'Valeanu', 'Adriana', 6, 6);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(63, 'Visan', 'Albert', 6, 6);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(64, 'Voicu', 'Madalina', 6, 6);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(65, 'Floroiu', 'Martin', 6, 6);



INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(66, 'Firea', 'Sorin', 8, 7);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(67, 'Paval', 'Laura', 8, 7);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(68, 'Pintea', 'Bianca', 8, 7);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(69, 'Dumea', 'Alexandru', 8, 7);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(70, 'Dragan', 'Raluca', 8, 7);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(71, 'Parfene', 'Marius', 8, 7);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(72, 'Ciulin', 'Crina', 8, 7);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(73, 'Cosma', 'Ovidiu', 8, 7);






INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(74, 'Adam', 'Elena', 9, 8);


INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(75, 'Nicolae', 'Sorina', 9, 8);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(76, 'Arabu', 'Liliana', 9, 8);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(77, 'Cupa', 'Valentina', 9, 8);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(78, 'Tutore', 'Rebeca', 9, 8);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(79, 'Iordachita', 'Stefan', 9, 8);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(80, 'Amarioarei', 'Ionut', 9, 8);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(81, 'Nimara', 'Dan', 9, 8);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(82, 'Pata', 'Oana', 9, 8);





INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(83, 'Sirbu', 'Oana', 11, 9);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(84, 'Burlacu', 'Cristian', 11, 9);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(85, 'Bendei', 'Miruna', 11, 9);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(86, 'Baractaru', 'Iustina', 11, 9);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(87, 'Onofrei', 'David', 11, 9);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(88, 'Bigu', 'Daniela', 11, 9);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(89, 'Delei', 'Teodor', 11, 9);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(90, 'Florea', 'Gianina', 11, 9);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(91, 'Vidineac', 'Denisa', 11, 9);





INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(92, 'Zlavog', 'Alexandru', 12, 10);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(93, 'Zianu', 'Mirela', 12, 10);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(94, 'Ursu', 'Calin', 12, 10);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(95, 'Adam', 'Adrian', 12, 10);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(96, 'Costan', 'Bogdan', 12, 10);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(97, 'Costin', 'Miriam', 12, 10);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(98, 'Ene', 'Silviu', 12, 10);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(99, 'Gavrila', 'Andreea', 12, 10);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(100, 'Buruiana', 'Alexandra', 12, 10);

INSERT INTO ELEV(id_elev, nume, prenume, clasa, id_grupa)
VALUES(101, 'Bara', 'Elena-Mihaela', 12, 10);



DECLARE
BEGIN
    
     FOR i IN 1..8 LOOP
        INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 101);
         INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 107);
    END LOOP;
    
     FOR i IN 9..14 LOOP
        INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 128);
         INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 124);
    END LOOP;
    
    FOR i IN 15..31 LOOP
        INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 104);
         INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 102);
         INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 103);
    END LOOP;

    FOR i IN 32..42 LOOP
        INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 117);
    END LOOP;


    FOR i IN 43..57 LOOP
        INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 105);
         INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 106);
         INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 110);
         INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 109);
    END LOOP;

    FOR i IN 58..65 LOOP
        INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 108);
         INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 114);
         INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 115);
    END LOOP;
    
    FOR i IN 66..73 LOOP
        INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 132);
         INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 133); 
    END LOOP;


    FOR i IN 74..82 LOOP
        INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 125);
         INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 129); 
    END LOOP;

    FOR i IN 83..91 LOOP
        INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 134);
    END LOOP;
    
    FOR i IN 92..101 LOOP
        INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 135);
         INSERT INTO CURSELEV(id_elev, id_curs)
        VALUES(i, 136); 
    END LOOP;
END;
/




INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(1, 101, 'Sediu Pallady');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(1, 102, 'Sediu Pallady');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(1, 103, 'Sediu Pallady');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(2, 104, 'Sediu Lujer');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(2, 105, 'Sediu Lujer');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(1, 106, 'Sediu Pallady');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(1, 107, 'Sediu Pallady');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(1, 108, 'Sediu Pallady');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(2, 109, 'Sediu Lujer');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(1, 110, 'Sediu Pallady');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 114, 'Sediu Victoria');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 115, 'Sediu Victoria');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 117, 'Sediu Victoria');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 124, 'Sediu Victoria');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 125, 'Sediu Victoria');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(1, 128, 'Sediu Pallady');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 129, 'Sediu Victoria');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 130, 'Sediu Victoria');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 132, 'Sediu Victoria');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 133, 'Sediu Victoria');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 134, 'Sediu Pallady');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 135, 'Sediu Pallady');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 136, 'Sediu Pallady');

INSERT INTO SEDIUCURS(id_locatie, id_curs, denumire_sediu)
VALUES(3, 137, 'Sediu Pallady');






SELECT * FROM PROFESOR;



SELECT * FROM CURS;









SELECT * FROM ELEV;

SELECT * FROM LOCATIE;

SELECT * FROM COORDONATOR;

SELECT * FROM GRUPA;



SELECT * FROM SEDIUCURS;

SELECT * FROM CURSELEV;





SELECT * FROM sediucurs;


--EX6.Defini?i un subprogram stocat care sã utilizeze un tip de colec?ie studiat. Apela?i subprogramul.

-- CERINTA --
-- DEFINITI UN SUBPROGRAM STOCAT CARE SA AFISEZE PENTRU FIECARE ELEV CARE SE AFLA IN CLASA A 6-A SAU A 7-A NUMELE,
-- PRENUMELE, CLASA, GRUPA, ID-UL COORDONATORULUI GRUPEI SI NUMARUL DE CURSURI LA CARE PARTICIPA


CREATE OR REPLACE PROCEDURE m1_mfl
IS
    TYPE rec IS RECORD(nume elev.nume%TYPE, prenume elev.prenume%TYPE, id_coord coordonator.id_coord%TYPE, nr_cursuri number, id_grupa grupa.id_grupa%TYPE, clasa elev.clasa%TYPE);
    TYPE tab1 IS TABLE OF rec;
    t tab1;
BEGIN
    select e.nume, e.prenume, g.id_coord, count(ce.id_curs), g.id_grupa, e.clasa bulk collect into t
    from elev e join grupa g on (e.id_grupa = g.id_grupa) join curselev ce on (e.id_elev = ce.id_elev)
    where e.clasa in (6, 7)
    group by e.nume, e.prenume, g.id_coord, g.id_grupa, e.clasa;
    
    for i in 1..t.count loop
        DBMS_OUTPUT.PUT_LINE(t(i).nume || ' ' || t(i).prenume || ' din clasa ' || t(i).clasa || ' GR ' || t(i).id_grupa || ' id coordonator ' || t(i).id_coord || ' participa la ' || t(i).nr_cursuri || ' cursuri' );
        DBMS_OUTPUT.PUT_LINE('');
    end loop;
END;
/

BEGIN
    m1_mfl;
END;
/

--EX7.Defini?i un subprogram stocat care sã utilizeze un tip de cursor studiat. Apela?i subprogramul.

-- CERINTA --

--DEFINITI UN SUBPROGRAM CARE SA UTILIZEZ UN CURSOS SI SA AFIZESE PENTRU FIECARE PROFESOR(NUME, PRENUME), MATERIA PE CARE O
--PREDA SI NUMARUL DE GRUPE LA CARE ACESTA TINE CURSURI.


CREATE OR REPLACE PROCEDURE m2_mfl
IS
    CURSOR c1 IS
    SELECT distinct p.id_prof id_prof, p.nume nume, p.prenume prenume, c.denumire denumire, count(distinct g.id_grupa) grupe
    FROM profesor p join curs c on (p.id_prof = c.id_prof) join curselev ce on(ce.id_curs = c.id_curs) join elev e on
    (e.id_elev = ce.id_elev)join grupa g on (e.id_grupa = g.id_grupa)
    group by p.id_prof, p.nume, p.prenume, c.denumire;
    
BEGIN
    FOR i IN c1 LOOP
        if i.grupe = 0 then
        dbms_output.put_line('Prof. ' || i.nume || ' ' || i.prenume || ' preda '|| i.denumire || ', nu tine cursuri pentru nicio grupa');
        elsif i.grupe = 1 then  
            dbms_output.put_line('Prof. ' || i.nume || ' ' || i.prenume || ' preda '|| i.denumire || ', tine cursuri unei singure grupe');
        else
            dbms_output.put_line('Prof. ' || i.nume || ' ' || i.prenume || ' preda '|| i.denumire || ', tine cursuri pentru ' || i.grupe || ' grupe');
        end if;
    end loop;
   
END;
/

BEGIN
    m2_mfl;
END;
/


--8.Defini?i un subprogram stocat de tip func?ie care sã utilizeze 3 dintre tabelele definite. 
--Trata?i toate excep?iile care pot apãrea. Apela?i subprogramul astfel încât sã eviden?ia?i toate cazurile tratate


--CERINTA--
-- DEFINITI UN SUBPROGRAM STOCAT DE TIP FUNCTIE CARE VA AVEA PARAMETRI DE INTRARE NUMELE UNUI PROFESOR SI
-- ID-UL UNEI LOCATII SI VA INTOARCE NUMARUL DE CURSURI PE CARE PROFESORUL CU NUMELE RESPECTIV 
-- LE TINE IN LOCATIA CU ID-UL DAT

--EXECPTII TRATATE : -> NU EXISTA PROFESORUL CU NUMELE DAT
--                   -> EXISTA MAI MULTI PROFESORI CU NUMELE DAT
--                   -> NU EXISTA LOCATIA CU ID-UL DAT

--TABELE FOLOSITE : -> PROFESOR
--                  -> CURS
--                  -> SEDIUCURS
--                  -> LOCATIE

CREATE OR REPLACE FUNCTION f1_mfl(fnume profesor.nume%TYPE, loc locatie.id_locatie%TYPE)
RETURN NUMBER IS
    nr number;
    n profesor.nume%TYPE;
    l locatie.id_locatie%TYPE;
    nr2 number;
    BEGIN
        select count(id_prof) into nr2
        from profesor
        where nume = fnume;      
        if nr2 = 0 then
            raise_application_error(-20009, 'Profesorul nu exista');
        elsif nr2 > 1 then
            raise_application_error(-20010, 'Mai multi profesori cu acelasi nume');
        else
            
            select count(id_locatie) into l
            from locatie
            where id_locatie = loc;
            if l = 0 then
                raise_application_error(-20011, 'Nu exista aceasta locatie');
            else
            SELECT COUNT(c.id_curs) INTO nr
             FROM curs c join profesor p on (c.id_prof = p.id_prof) join sediucurs sd on (c.id_curs = sd.id_curs) join locatie l on (l.id_locatie = sd.id_locatie)
            WHERE p.nume  = fnume and l.id_locatie = loc;
            end if;
        end if;
    RETURN nr;
    END f1_mfl;
/

BEGIN
   --dbms_output.put_line(f1_mfl('Ciulin',3));
   --dbms_output.put_line(f1_mfl('Ci',2));
   dbms_output.put_line(f1_mfl('Ciulin',7));
   
END;
/




--9.Defini?i un subprogram stocat de tip procedurã care sã utilizeze 5 dintre tabelele definite. 
--Trata?i toate excep?iile care pot apãrea. 
--Apela?i subprogramulastfel încât sã eviden?ia?i toate cazurile tratate.

--CERINTA--

--DEFINITI UN SUBPROGRAM STOCAT DE TIP PROCEDURA CARE, PENTRU O CLASA DATA CA PARAMETRU
--SA AFISEZE ID-UL SEDIULUI UNDE SE TIN CELE MAI MULTE CURSURI PENTRU CLASA RESPECTIVA,
--NUMARUL DE CURSURI, DENUMIREA SEDIULUI SI ADRESA COMPLETA A 


--EXCEPTII TRATATE: -> NU EXISTA CLASA DATA
--                  -> EXISTA CLASA DAR NU MERGE LA NICIUN CURS



CREATE OR REPLACE PROCEDURE m3_mfl(cl elev.clasa%TYPE) IS
    loc locatie.id_locatie%TYPE;
    maxi number;
    str locatie.strada%TYPE;
    nr locatie.numar%TYPE;
    postal locatie.cod_postal%TYPE;
    sed sediucurs.denumire_sediu%TYPE;
    
BEGIN
    select count(distinct clasa) into maxi
    from elev
    where clasa = cl;
    IF maxi = 0 THEN
        RAISE_APPLICATION_ERROR(-20909, 'Clasa nu este corecta sau nu exista');
    ELSE    
            
        select id_locatie, max(nr), strada, numar, cod_postal, denumire_sediu into loc, maxi, str, nr, postal, sed
        from (select sc.id_locatie, count(distinct c.id_curs) nr, loc.strada, loc.numar, loc.cod_postal, sc.denumire_sediu
                from locatie loc join sediucurs sc on (loc.id_locatie = sc.id_locatie) join curs c on (c.id_curs = sc.id_curs)
                join curselev ce on (c.id_curs = ce.id_curs) join elev e on (ce.id_elev = e.id_elev)
                where e.clasa = cl
                group by sc.id_locatie, loc.strada, loc.numar, loc.cod_postal, sc.denumire_sediu
                order by count(distinct c.id_curs) desc)
        where rownum <=1
        group by id_locatie, strada, numar, cod_postal, denumire_sediu;
        
        IF maxi = 0 THEN
            RAISE_APPLICATION_ERROR(-20920, 'Clasa exista, dar nu participa la niciun curs');
        END IF;
        
        dbms_output.put_line('Pentru clasa a ' || cl || '-a cele mai multe cursuri se tin in locatia cu id : ' || loc);
        dbms_output.put_line('Numar cursuri: ' || maxi);
        dbms_output.put_line('Denumire sediu: ' || sed);
        dbms_output.put_line('Adresa completa: ' || str || ' nr. ' || nr || ' cod postal ' || postal);
    END IF;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('NU S-AU GASIT DATE CONCLUDENTE');
  
   
END;
/
    
BEGIN
    m3_mfl(12);  
END;
/





--EX10.Defini?i un triggerde tip LMD la nivel de comandã. Declan?a?i trigger-ul.

--CERINTA--
--CREATI UN TRIGGER CARE SA NU PERMITA STERGEREA SAU MODIFICAREA TABELULUI CURS
--DECAT UTILIZATORULUI CU NUMELE 'MARIA' IN INTERVALUL ORAR 08:00-16:00


CREATE OR REPLACE TRIGGER trigg1_mfl
    BEFORE DELETE OR UPDATE ON curs
BEGIN
    IF (USER != UPPER('MARIA') OR (TO_CHAR(SYSDATE,'D') = 1) OR (TO_CHAR(SYSDATE,'HH24') NOT BETWEEN 8 AND 20)) THEN
    RAISE_APPLICATION_ERROR(-20001, 'TABELUL NU POATE FI MODIFICAT');
    END IF;
END;
/

DROP TRIGGER trigg1_mfl;


--11.Defini?i un triggerde tip LMD la nivel de linie.Declan?a?i trigger-ul

--CERINTA--
--DEFINITI UN TRIGGER LA NIVEL DE LINIE CARE SA NU PERMITA MODIFICAREA DIN TABELUL GRUPA
--A COLOANEI DATA_INFIINTARE CU O VALOARE A ANULUI MAI MARE DECAT ANUL CURENT



CREATE OR REPLACE TRIGGER trigg2_mfl
BEFORE UPDATE OF data_infiintare ON grupa
FOR EACH ROW
BEGIN
    IF(to_number(to_char(:NEW.data_infiintare, 'yyyy')) > to_number(to_char(sysdate, 'yyyy'))) THEN
        RAISE_APPLICATION_ERROR(-20001, 'ANUL INFINTARII GRUPEI NU POATE FI ALTUL DECAT CEL CURENT');
    END IF;
END;
/

DROP TRIGGER trigg2_mfl;


--12.Defini?i un triggerde tip LDD. Declan?a?i trigger-ul.


CREATE TABLE audit_mfl
 (userr VARCHAR2(30),
 bazadedate VARCHAR2(50),
 event VARCHAR2(20),
 nume_obiect VARCHAR2(30),
 data DATE)
 ;
CREATE OR REPLACE TRIGGER trigg4_mfl
 AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
 INSERT INTO audit_mfl VALUES (
    sys.login_user,
    sys.database_name,
    sys.sysevent,
    sys.dictionary_obj_name,
    SYSDATE
);
END;
/

CREATE INDEX ind_mfl ON grupa(data_infiintare);
DROP INDEX ind_mfl;

SELECT * FROM audit_mfl;
DROP TRIGGER trigg4_mfl;


--13.Defini?i un pachet care sã con?inã toate obiectele definite în cadrul proiectului.


CREATE OR REPLACE PACKAGE all_of_them AS
    
        PROCEDURE m1_mfl;
        PROCEDURE m2_mfl;
        PROCEDURE m3_mfl(cl elev.clasa%TYPE);
        FUNCTION f1_mfl(fnume profesor.nume%TYPE, loc locatie.id_locatie%TYPE)
        RETURN NUMBER;
END;        
/

CREATE OR REPLACE PACKAGE BODY all_of_them AS

    PROCEDURE m1_mfl IS
        TYPE rec IS RECORD(nume elev.nume%TYPE, prenume elev.prenume%TYPE, id_coord coordonator.id_coord%TYPE, nr_cursuri number, id_grupa grupa.id_grupa%TYPE, clasa elev.clasa%TYPE);
        TYPE tab1 IS TABLE OF rec;
        t tab1;
    BEGIN
        select e.nume, e.prenume, g.id_coord, count(ce.id_curs), g.id_grupa, e.clasa bulk collect into t
        from elev e join grupa g on (e.id_grupa = g.id_grupa) join curselev ce on (e.id_elev = ce.id_elev)
        where e.clasa in (6, 7)
        group by e.nume, e.prenume, g.id_coord, g.id_grupa, e.clasa;
        
        for i in 1..t.count loop
            DBMS_OUTPUT.PUT_LINE(t(i).nume || ' ' || t(i).prenume || ' din clasa ' || t(i).clasa || ' GR ' || t(i).id_grupa || ' id coordonator ' || t(i).id_coord || ' participa la ' || t(i).nr_cursuri || ' cursuri' );
            DBMS_OUTPUT.PUT_LINE('');
        end loop;
    END;
    
    
     PROCEDURE m2_mfl IS
     
     CURSOR c1 IS
            SELECT distinct p.id_prof id_prof, p.nume nume, p.prenume prenume, c.denumire denumire, count(distinct g.id_grupa) grupe
            FROM profesor p join curs c on (p.id_prof = c.id_prof) join curselev ce on(ce.id_curs = c.id_curs) join elev e on
            (e.id_elev = ce.id_elev)join grupa g on (e.id_grupa = g.id_grupa)
            group by p.id_prof, p.nume, p.prenume, c.denumire;
            
        BEGIN
            FOR i IN c1 LOOP
                if i.grupe = 0 then
                dbms_output.put_line('Prof. ' || i.nume || ' ' || i.prenume || ' preda '|| i.denumire || ', nu tine cursuri pentru nicio grupa');
                elsif i.grupe = 1 then  
                    dbms_output.put_line('Prof. ' || i.nume || ' ' || i.prenume || ' preda '|| i.denumire || ', tine cursuri unei singure grupe');
                else
                    dbms_output.put_line('Prof. ' || i.nume || ' ' || i.prenume || ' preda '|| i.denumire || ', tine cursuri pentru ' || i.grupe || ' grupe');
                end if;
            end loop;
        END;
        
        
         PROCEDURE m3_mfl(cl elev.clasa%TYPE) IS
                loc locatie.id_locatie%TYPE;
                maxi number;
                str locatie.strada%TYPE;
                nr locatie.numar%TYPE;
                postal locatie.cod_postal%TYPE;
                sed sediucurs.denumire_sediu%TYPE;
                
            BEGIN
                select count(distinct clasa) into maxi
                from elev
                where clasa = cl;
                IF maxi = 0 THEN
                    RAISE_APPLICATION_ERROR(-20909, 'Clasa nu este corecta sau nu exista');
                ELSE    
                        
                    select id_locatie, max(nr), strada, numar, cod_postal, denumire_sediu into loc, maxi, str, nr, postal, sed
                    from (select sc.id_locatie, count(distinct c.id_curs) nr, loc.strada, loc.numar, loc.cod_postal, sc.denumire_sediu
                            from locatie loc join sediucurs sc on (loc.id_locatie = sc.id_locatie) join curs c on (c.id_curs = sc.id_curs)
                            join curselev ce on (c.id_curs = ce.id_curs) join elev e on (ce.id_elev = e.id_elev)
                            where e.clasa = cl
                            group by sc.id_locatie, loc.strada, loc.numar, loc.cod_postal, sc.denumire_sediu
                            order by count(distinct c.id_curs) desc)
                    where rownum <=1
                    group by id_locatie, strada, numar, cod_postal, denumire_sediu;
                    
                    IF maxi = 0 THEN
                        RAISE_APPLICATION_ERROR(-20920, 'Clasa exista, dar nu participa la niciun curs');
                    END IF;
                    
                    dbms_output.put_line('Pentru clasa a ' || cl || '-a cele mai multe cursuri se tin in locatia cu id : ' || loc);
                    dbms_output.put_line('Numar cursuri: ' || maxi);
                    dbms_output.put_line('Denumire sediu: ' || sed);
                    dbms_output.put_line('Adresa completa: ' || str || ' nr. ' || nr || ' cod postal ' || postal);
                END IF;
                    
                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                            dbms_output.put_line('NU S-AU GASIT DATE CONCLUDENTE');
                END;
                
                
                
                
           FUNCTION f1_mfl(fnume profesor.nume%TYPE, loc locatie.id_locatie%TYPE) 
                        RETURN NUMBER IS
                        nr number;
                        n profesor.nume%TYPE;
                        l locatie.id_locatie%TYPE;
                        nr2 number;
                        BEGIN
                            select count(id_prof) into nr2
                            from profesor
                            where nume = fnume;      
                            if nr2 = 0 then
                                raise_application_error(-20009, 'Profesorul nu exista');
                            elsif nr2 > 1 then
                                raise_application_error(-20010, 'Mai multi profesori cu acelasi nume');
                            else
                                
                                select count(id_locatie) into l
                                from locatie
                                where id_locatie = loc;
                                if l = 0 then
                                    raise_application_error(-20011, 'Nu exista aceasta locatie');
                                else
                                SELECT COUNT(c.id_curs) INTO nr
                                 FROM curs c join profesor p on (c.id_prof = p.id_prof) join sediucurs sd on (c.id_curs = sd.id_curs) join locatie l on (l.id_locatie = sd.id_locatie)
                                WHERE p.nume  = fnume and l.id_locatie = loc;
                                end if;
                            end if;
                        RETURN nr;
            END;  
   
END;
/ 
        
BEGIN
    all_of_them.m1_mfl;
    all_of_them.m2_mfl;
    all_of_them.m3_mfl(7);
    dbms_output.put_line(all_of_them.f1_mfl('Ciulin', 2));
    
END;
/






