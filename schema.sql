/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar,
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

-- PROJECT 2

ALTER TABLE animals
ADD species varchar;

-- PROJECT 3

CREATE TABLE owners (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    full_name varchar,
    age int
);

CREATE TABLE species (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id int;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD COLUMN owner_id int;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);