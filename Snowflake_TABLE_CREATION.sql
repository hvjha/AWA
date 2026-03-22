CREATE DATABASE IF NOT EXISTS SNOWFLAKE_CLASS_4;
USE DATABASE SNOWFLAKE_CLASS_4;
CREATE SCHEMA IF NOT EXISTS SNOW_C_4_SCHEMA;
USE SCHEMA SNOW_C_4_SCHEMA;

CREATE OR REPLACE TABLE AJ_PETS
(
    petID VARCHAR(10) NOT NULL PRIMARY KEY,
    Name VARCHAR(20),
    Kind STRING,
    Gender CHAR(7),
    Age DECIMAL(5,2),
    OwnerID INTEGER 
);

DESCRIBE TABLE AJ_PETS;

INSERT INTO AJ_PETS VALUES
    ('Ger01', 'German sefer', 'Guard', 'Male',3, 001),
    ('Rot01', 'Rotwiller', 'Sneffing Dog', 'Female',4,002),
    ('Gol01', 'Golden Retwiwer', 'Guard', 'Male', 2, 002),
    ('Pum01', 'Pummerian', 'Guard', 'Male', 1, 003);

SELECT * FROM AJ_PETS;
