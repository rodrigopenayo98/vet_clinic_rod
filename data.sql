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

-------------------------------------------------------

INSERT INTO vets (name, age, date_of_graduation) VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

-------------------------------------------------------

INSERT INTO specializations (vet_id, species_id) VALUES
    (1, 1),
    (3, 2),
    (3, 1),
    (4, 2);


-------------------------------------------------------

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES
    (1, 1, '2020-05-24'),
    (1, 3, '2020-07-22'),
    (2, 4, '2021-02-02'),
    (3, 2, '2020-01-05'),
    (4, 2, '2020-05-24'),
    (4, 3, '2020-07-22'),
    (5, 4, '2021-02-02'),
    (6, 2, '2020-01-05'),
    (6, 2, '2020-03-08'),
    (6, 2, '2020-05-14'),
    (7, 3, '2021-05-04'),
    (8, 4, '2021-02-24'),
    (9, 1, '2019-12-21'),
    (9, 1, '2020-08-10'),
    (9, 3, '2021-04-07'),
    (10, 2, '2019-09-29'),
    (11, 4, '2020-10-03'),
    (11, 4, '2020-11-04'),
    (12, 1, '2019-01-24'),
    (12, 1, '2019-05-15'),
    (12, 1, '2020-02-27'),
    (12, 1, '2020-08-03'),
    (13, 3, '2020-05-24'),
    (13, 1, '2021-01-11');

--------------------------------------------------------

