INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
    ('Agumon', '2020-02-03', 0, true, 10.23),
    ('Gabumon', '2018-11-15', 2, true, 8.0),
    ('Pikachu', '2021-01-07', 1, false, 15.04),
    ('Devimon', '2017-05-12', 5, true, 11.0);

------------------------------------------------------    

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES
    ('Charmander', '2020-02-08', 0, false, -11, 'Unspecified'),
    ('Plantmon', '2021-11-15', 2, true, -5.7, 'Unspecified'),
    ('Squirtle', '1993-04-02', 3, false, -12.13, 'Unspecified'),
    ('Angemon', '2005-06-12', 1, true, -45, 'Unspecified'),
    ('Boarmon', '2005-06-07', 7, true, 20.4, 'Unspecified'),
    ('Blossom', '1998-10-13', 3, true, 17, 'Unspecified'),
    ('Ditto', '2022-05-14', 4, true, 22, 'Unspecified');

-------------------------------------------------------

INSERT INTO owners (full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

--------------------------------------------------------

INSERT INTO species (name)
VALUES
    ('Pokémon'),
    ('Digimon');

--------------------------------------------------------

UPDATE animals
SET species_id = (
    CASE
        WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
        ELSE (SELECT id FROM species WHERE name = 'Pokémon')
    END
);

--------------------------------------------------------

UPDATE animals
SET owner_id = (
    CASE
        WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
        WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
        WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
        WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
        WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
    END
);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT * FROM (SELECT id FROM animals) animal_ids,
               (SELECT id FROM vets) vets_ids,
               generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

INSERT INTO owners (full_name, email)
SELECT 'Owner' || generate_series(1, 2500000), 'owner_' || generate_series(1, 2500000) || '@mail.com';
