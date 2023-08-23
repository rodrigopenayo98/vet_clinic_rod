SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-------------------------------------------------------

-- Start a new transaction
BEGIN;

-- Update all animals' species to 'unspecified' within the transaction
UPDATE animals SET species = 'unspecified';

-- View the current state of the animals table
SELECT * FROM animals;

-- Roll back the transaction to undo the updates
ROLLBACK;

-- View the animals table after rolling back (no changes should be visible)
SELECT * FROM animals;

-- Start a new transaction
BEGIN;

-------------------------------------------------------

-- Update animals with names ending in 'mon' to have species 'digimon'
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

-------------------------------------------------------

-- Update animals with no specified species to have species 'pokemon'
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

-------------------------------------------------------


-- Transaction 1: Deleting Records Born After January 1, 2022
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
-- Create a savepoint after the deletion
SAVEPOINT after_delete;

-- Transaction 2: Updating Weights and Rolling Back to Savepoint
UPDATE animals
SET weight_kg = weight_kg * -1;
-- Roll back to the savepoint to undo the weight updates
ROLLBACK TO after_delete;

-- Transaction 3: Final Weight Adjustments and Committing Changes
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
-- Commit the final changes
COMMIT;


--------------------------------------------------------

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never attempted to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of the animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes more, neutered or non-neutered animals?
SELECT neutered, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
GROUP BY neutered;

-- What is the minimum and maximum weight of each animal species?
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

-- What is the average escape attempts per animal species born between 1990 and 2000?
SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
