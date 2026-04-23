SELECT COUNT(*) AS countries_rows FROM countries;
USE macaw_project;
TRUNCATE TABLE countries;
USE macaw_project;
TRUNCATE TABLE countries;
INSERT INTO countries (country_id, country_name)
VALUES
(1, 'Bolivia'),
(2, 'Brazil'),
(3, 'Costa Rica'),
(4, 'Nicaragua');
SELECT COUNT(*) AS countries_rows FROM countries;
USE macaw_project;
TRUNCATE TABLE habitat_loss;
SELECT COUNT(*) AS habitat_loss_rows FROM habitat_loss;
INSERT INTO habitat_loss (
    habitat_id,
    country_id,
    year,
    forest_area_pct_land,
    natural_forest_loss_mha,
    co2_emissions_mt,
    notes
)
VALUES
(1, 1, 2024, 46.30, 1.70, 540.00, 'Bolivia forest loss'),
(2, 2, 2023, 59.00, 0.85, 420.00, 'Brazil forest pressure'),
(3, 3, 2023, 57.00, 0.20, 120.00, 'Costa Rica habitat pressure'),
(4, 4, 2023, 25.00, 0.15, 95.00, 'Nicaragua habitat pressure');
SELECT COUNT(*) AS habitat_loss_rows FROM habitat_loss;
USE macaw_project;
TRUNCATE TABLE species_country_range;
SELECT COUNT(*) AS species_country_range_rows FROM species_country_range;
INSERT INTO species_country_range (
    range_id,
    species_id,
    country_id,
    habitat_importance
)
VALUES
(1, 1, 1, 'Critical'),
(2, 2, 1, 'Critical'),
(3, 3, 2, 'Moderate'),
(4, 3, 3, 'Moderate'),
(5, 3, 4, 'Moderate');
SELECT COUNT(*) AS species_country_range_rows FROM species_country_range;
USE macaw_project;
TRUNCATE TABLE trade_records;
SELECT COUNT(*) AS trade_records_rows FROM trade_records;
INSERT INTO trade_records (
    trade_id,
    year,
    species_id,
    exporter_country,
    importer_country,
    source,
    purpose,
    term,
    quantity
)
VALUES
(1, 2021, 1, 'Bolivia', 'Germany', 'C', 'BIR', 'Live', 2),
(2, 2020, 2, 'Bolivia', 'United States', 'C', 'BIR', 'Live', 1),
(3, 2019, 3, 'Brazil', 'Canada', 'C', 'BIR', 'Live', 4);
SELECT COUNT(*) AS trade_records_rows FROM trade_records;
USE macaw_project;
SELECT COUNT(*) AS macaw_species_rows FROM macaw_species;
SELECT COUNT(*) AS countries_rows FROM countries;
SELECT COUNT(*) AS habitat_loss_rows FROM habitat_loss;
SELECT COUNT(*) AS species_country_range_rows FROM species_country_range;
SELECT COUNT(*) AS trade_records_rows FROM trade_records;
SELECT
    s.common_name,
    c.country_name,
    r.habitat_importance
FROM macaw_species s
JOIN species_country_range r
    ON s.species_id = r.species_id
JOIN countries c
    ON r.country_id = c.country_id;
    SELECT
    s.common_name,
    c.country_name,
    r.habitat_importance
FROM macaw_species s
JOIN species_country_range r
    ON s.species_id = r.species_id
JOIN countries c
    ON r.country_id = c.country_id;
    SELECT
    s.common_name,
    c.country_name,
    h.year,
    h.natural_forest_loss_mha
FROM macaw_species s
JOIN species_country_range r
    ON s.species_id = r.species_id
JOIN countries c
    ON r.country_id = c.country_id
JOIN habitat_loss h
    ON c.country_id = h.country_id;
    SELECT
    s.common_name,
    t.year,
    t.exporter_country,
    t.importer_country,
    t.quantity
FROM macaw_species s
JOIN trade_records t
    ON s.species_id = t.species_id;
    SELECT
    s.common_name,
    s.red_list_category,
    c.country_name,
    h.natural_forest_loss_mha,
    t.quantity
FROM macaw_species s
JOIN species_country_range r
    ON s.species_id = r.species_id
JOIN countries c
    ON r.country_id = c.country_id
JOIN habitat_loss h
    ON c.country_id = h.country_id
LEFT JOIN trade_records t
    ON s.species_id = t.species_id;
    SELECT
    s.common_name,
    c.country_name,
    r.habitat_importance
FROM macaw_species s
JOIN species_country_range r
    ON s.species_id = r.species_id
JOIN countries c
    ON r.country_id = c.country_id;
    SELECT
    s.common_name,
    s.red_list_category,
    c.country_name,
    h.natural_forest_loss_mha,
    t.quantity
FROM macaw_species s
JOIN species_country_range r
    ON s.species_id = r.species_id
JOIN countries c
    ON r.country_id = c.country_id
JOIN habitat_loss h
    ON c.country_id = h.country_id
LEFT JOIN trade_records t
    ON s.species_id = t.species_id;