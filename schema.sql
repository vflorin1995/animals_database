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

-- PROJECT 4

CREATE TABLE vets (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar,
    age int,
    date_of_graduation date
);

CREATE TABLE specializations (
    species_id int REFERENCES species (id),
    vets_id int REFERENCES vets (id),
    PRIMARY KEY (species_id, vets_id)
);

ALTER TABLE animals ADD PRIMARY KEY (id);

CREATE TABLE visits (
    animals_id int REFERENCES animals (id),
    vets_id int REFERENCES vets (id),
    visit_date date,
    PRIMARY KEY (animals_id, vets_id, visit_date)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visits_animals_asc ON visits(animals_id);
CREATE INDEX visits_vets_asc ON visits(vets_id);
CREATE INDEX owners_email_asc ON owners(email);