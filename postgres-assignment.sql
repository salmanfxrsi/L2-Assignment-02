-- Table 1: Rangers
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100)
);

INSERT INTO rangers (name, region) VALUES
('David Stone', 'Emerald Forest'),
('Eva Brook', 'Sunset Canyon'),
('Liam Cole', 'Crystal Lake');

-- Table 2: Species
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Bengal Tiger', 'Panthera tigris tigris', '1800-04-15', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-07-21', 'Vulnerable'),
('Humpback Whale', 'Megaptera novaeangliae', '1756-08-03', 'Least Concern'),
('Orangutan', 'Pongo pygmaeus', '1835-12-02', 'Critically Endangered'),
('Arctic Fox', 'Vulpes lagopus', '1792-05-18', 'Least Concern');

-- Table 3: Sightings
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    sighting_time TIMESTAMP,
    location VARCHAR(100),
    notes TEXT
);

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Tiger Creek Trail', '2024-07-01 06:20:00', 'Two tigers near water'),
(2, 2, 'Redleaf Ridge', '2024-07-02 09:10:00', 'Red panda climbing tree'),
(3, 3, 'Wave Bay Lookout', '2024-07-03 11:00:00', 'Humpback breaching'),
(4, 1, 'Canopy Cliff', '2024-07-04 07:40:00', 'Orangutan seen feeding in trees');



SELECT * FROM sightings;


-- Problem 1: 
INSERT INTO rangers(name , region) VALUES('Derek Fox', 'Coastal plains');

-- Problem 3:
SELECT * FROM sightings WHERE location ILIKE '%Pass%';