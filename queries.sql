/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth>'01-01-2016' AND date_of_birth<'01-01-2019';
SELECT * FROM animals WHERE escape_attempts < 3;
SELECT * FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT * FROM animals WHERE weight_kg > 10.5; 
SELECT * FROM animals WHERE neutered IS true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg>=10.4 AND weight_kg<=17.3;

-- PROJECT 2

BEGIN;
UPDATE animals SET species = 'undefined';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'Digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'Pokemon' WHERE species LIKE '';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth>'01-01-2022';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * (-1);
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * (-1) WHERE weight_kg<0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth>'01-01-1990' AND date_of_birth<'01-01-2000' GROUP BY species;

-- PROJECT 3

SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM species JOIN animals ON species.id = animals.species_id WHERE species.name = 'Pokemon';
SELECT full_name, name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;
SELECT species.name, COUNT(*) FROM species JOIN animals ON species.id = animals.species_id GROUP BY species.name;
SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell' AND animals.name LIKE '%mon';
SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts=0;
SELECT owners.full_name as full_name , COUNT(*) as count FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY count DESC LIMIT 1;

-- PROJECT 4

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name='William Tatcher' ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(*) AS DifferentAnimalsCount FROM (SELECT DISTINCT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name='Stephanie Mendez') AS foo;

SELECT vets.name, species.name FROM vets FULL JOIN specializations ON vets.id = specializations.vets_id FULL JOIN species ON specializations.species_id = species.id;

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name='Stephanie Mendez' AND visits.visit_date > '01-04-2019' AND visits.visit_date <'30-08-2020';

SELECT animals.name, COUNT(*) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id GROUP BY animals.name ORDER BY count DESC LIMIT 1;

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name='Maisy Smith' ORDER BY visits.visit_date ASC LIMIT 1;

SELECT animals.*, vets.*, visits.visit_date FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(*) FROM specializations RIGHT JOIN vets ON specializations.vets_id = vets.id JOIN visits ON vets.id = visits.vets_id  JOIN animals ON animals.id = visits.animals_id JOIN species ON animals.species_id = species.id WHERE specializations.species_id <> species.id OR specializations.species_id IS NULL;

SELECT species.name, COUNT(*) FROM vets JOIN visits ON vets.id = visits.vets_id JOIN animals ON animals.id = visits.animals_id JOIN species ON animals.species_id = species.id WHERE vets.name='Maisy Smith' GROUP BY species.name ORDER BY count DESC LIMIT 1;