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

--------------------------------------

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INTEGER,
    date_of_graduation DATE
);

--------------------------------------

CREATE TABLE specializations (
    vet_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id)
);

--------------------------------------

CREATE TABLE visits (
    animal_id INTEGER REFERENCES animals(id),
    vet_id INTEGER REFERENCES vets(id),
    visit_date DATE
);




