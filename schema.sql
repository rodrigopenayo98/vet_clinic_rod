CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2),
);

--------------------------------------

ALTER TABLE animals
ADD COLUMN species VARCHAR(100);

--------------------------------------

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age INTEGER
);

--------------------------------------

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

--------------------------------------

ALTER TABLE animals
ALTER COLUMN id SET DEFAULT nextval('animals_id_seq');

--------------------------------------

ALTER TABLE animals
DROP COLUMN species;

--------------------------------------

ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species(id);

--------------------------------------

ALTER TABLE animals
ADD COLUMN owner_id INTEGER REFERENCES owners(id);

-------------------------------------- perfomance

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

------------------------------------- to improve perfomance time

-- create new ids

CREATE INDEX idx_visits_animal_id ON visits (animal_id);

CREATE INDEX idx_visits_vet_id ON visits (vet_id);

CREATE INDEX idx_owners_email ON owners (email);




