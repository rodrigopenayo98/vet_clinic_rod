SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-------------------------------------------------------

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

-------------------------------------------------------

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

-------------------------------------------------------

-- Transacción 1
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT after_delete;

-- Transacción 2
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO after_delete;

-- Transacción 3
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

--------------------------------------------------------

-- Query 1
SELECT COUNT(*) FROM animals;

-- Query 2
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- Query 3
SELECT AVG(weight_kg) FROM animals;

-- Query 4
SELECT neutered, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
GROUP BY neutered;

-- Query 5
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

-- Query 6
SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
