---Cat breeds

Create TABLE cats (
    breed VARCHAR(100),
    size VARCHAR(50),
    shedding VARCHAR(20),
    
);
--inserting the values
INSERT INTO cats (breed, size, shedding)
VALUES
('Abyssinian', 'small', 'minimal'),
('Cornish Rex', 'small', 'none'),
('Devon Rex' , 'small', 'none'),
('Peterbald', 'small', 'none'),
('American Bobtail', 'large', 'minimal'),
('American Shorthair', 'large', 'minimal'),
('American Wirehair', 'large', 'minimal'),
('British Shorthair', 'large', 'minimal'),
('Chartreux', 'large', 'minimal' ),
('Norwegian Forest', 'large', 'minimal'),
('Birman', 'large', 'heavy'),
('Himalayan', 'large', 'heavy'),
('Persian', 'large', 'heavy');

--checking to see if data was properly put in
select *
from cats

--organizing the data
SELECT *
FROM cats
ORDER BY breed ASC
