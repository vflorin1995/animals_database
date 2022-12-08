/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '03-02-2020', 0, true, 10.23 );
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '15-11-2018', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '07-01-2021', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '12-05-2017', 5, true, 11);

-- PROJECT 2

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '08-02-2020', 0, false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '12-11-2021', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '02-04-1993', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '12-06-2005', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '07-06-2005', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '13-11-1998', 3, true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '14-05-2022', 4, true, 22);

-- PROJECT 3

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS null;


UPDATE animals SET owner_id = 1 WHERE name='Agumon';
UPDATE animals SET owner_id = 2 WHERE name='Gabumon';
UPDATE animals SET owner_id = 2 WHERE name='Pikachu';
UPDATE animals SET owner_id = 3 WHERE name='Devimon';
UPDATE animals SET owner_id = 3 WHERE name='Plantmon';
UPDATE animals SET owner_id = 4 WHERE name='Charmander';
UPDATE animals SET owner_id = 4 WHERE name='Squirtle';
UPDATE animals SET owner_id = 4 WHERE name='Blossom';
UPDATE animals SET owner_id = 5 WHERE name='Angemon';
UPDATE animals SET owner_id = 5 WHERE name='Boarmon';