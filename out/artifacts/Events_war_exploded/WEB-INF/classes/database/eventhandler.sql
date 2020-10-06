CREATE TABLE IF NOT EXISTS serviceprovider (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    conpanyname VARCHAR (50) UNIQUE KEY NOT NULL ,
    email VARCHAR (100) NOT NULL UNIQUE KEY ,
    description TEXT NOT NULL ,
    location VARCHAR(100) NOT NULL ,
    username VARCHAR(20) UNIQUE KEY NOT NULL ,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer(
    id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL ,
    nationalid BIGINT NOT NULL UNIQUE KEY ,
    email VARCHAR(100) NOT NULL ,
    phonenumber VARCHAR(20) UNIQUE KEY NOT NULL ,
    username VARCHAR(20) UNIQUE KEY NOT NULL ,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS host(
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    hostname VARCHAR(100) UNIQUE KEY NOT NULL ,
    krapin VARCHAR(15) NOT NULL UNIQUE KEY ,
    hostemail VARCHAR(100) NOT NULL UNIQUE KEY ,
    phonenumber VARCHAR(15) NOT NULL UNIQUE KEY ,
    username VARCHAR(20) UNIQUE KEY NOT NULL ,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS event(
    id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
    eventname VARCHAR(100) NOT NULL ,
    eventtype VARCHAR(30) NOT NULL ,
    description TEXT NOT NULL ,
    eventlocation VARCHAR(100) NOT NULL ,
    duration INT NOT NULL DEFAULT 1,
    eventdate VARCHAR(20) NOT NULL ,
    eventhost BIGINT NOT NULL ,
    evententryfee DOUBLE NOT NULL DEFAULT 0.0,
    FOREIGN KEY (eventhost) REFERENCES host(id)
);

CREATE TABLE IF NOT EXISTS sponsor(
    id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
    sponsorname VARCHAR(50) NOT NULL ,
    email VARCHAR(100) NOT NULL UNIQUE KEY ,
    location VARCHAR(100) NOT NULL ,
    sponsorshiprequirements TEXT NOT NULL ,
    krapin VARCHAR(15) UNIQUE KEY NOT NULL ,
    username VARCHAR(20) NOT NULL UNIQUE KEY ,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS sponsorshiprequest(
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    eventid BIGINT NOT NULL ,
    sponsorid BIGINT NOT NULL ,
    FOREIGN KEY (eventid) REFERENCES event(id),
    FOREIGN KEY (sponsorid) REFERENCES sponsor(id)
);

CREATE TABLE IF NOT EXISTS eventsponsor(
    eventid BIGINT NOT NULL ,
    sponsorid BIGINT NOT NULL ,
    FOREIGN KEY (eventid) REFERENCES event(id),
    FOREIGN KEY (sponsorid) REFERENCES sponsor(id)
);

CREATE TABLE IF NOT EXISTS eventticket(
    ticketnumber BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customerid BIGINT NOT NULL ,
    eventid BIGINT NOT NULL ,
    FOREIGN KEY (customerid) REFERENCES customer(id),
    FOREIGN KEY (eventid) REFERENCES event(id)
);

create table serviceproviderservice(
                                       id bigint not null AUTO_INCREMENT primary key,
                                       serviceProviderId bigint not null,
                                       price double not null,
                                       serviceName varchar(100) not null,
                                       description text not null,
                                       FOREIGN KEY (serviceProviderId) REFERENCES serviceprovider(id));
