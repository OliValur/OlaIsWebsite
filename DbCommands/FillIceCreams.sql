-- Drop tables in reverse dependency order
DROP TABLE IF EXISTS Condiments;
DROP TABLE IF EXISTS IceCreamTypes;
DROP TABLE IF EXISTS CondimentTypes;
DROP TABLE IF EXISTS Products;

-- Create CondimentTypes first
CREATE TABLE CondimentTypes (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Products (
    ID INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incrementing primary key
    Title NVARCHAR(100) NOT NULL, -- Ice cream name, not null
    SmallPrice INT NOT NULL, -- Price for small size, not null
    MediumPrice INT NOT NULL, -- Price for medium size, not null
    LargePrice INT NOT NULL, -- Price for large size, not null
    ChildSizePrice INT NOT NULL, -- Price for child size, not null
    Description NVARCHAR(500), -- Description of the ice cream
    ImageUrl NVARCHAR(255), -- URL for the image of the ice cream
);


-- Create IceCreamTypes
CREATE TABLE IceCreamTypes (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Vegetarian BIT NOT NULL,
    Vegan BIT NOT NULL,
    InStock BIT NOT NULL
);

-- Create Condiments with a foreign key reference to CondimentTypes
CREATE TABLE Condiments (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Vegetarian BIT NOT NULL,
    Vegan BIT NOT NULL,
    InStock BIT NOT NULL,
    CondimentTypeID INT NOT NULL,
    FOREIGN KEY (CondimentTypeID) REFERENCES CondimentTypes(ID)
);

-- Insert into CondimentTypes
INSERT INTO CondimentTypes (Title, Price) VALUES
('Sauce', 150),
('Candy', 250),
('Fruit', 200);

INSERT INTO IceCreamTypes (Title, Vegetarian, Vegan,  InStock) VALUES
('Rjómaís', 1, 0, 1),
('Gamli Ísinn', 1, 0,  1),
('Vegan Vanillu Ís', 1, 1, 1),
('Mango Sorbet', 1, 1, 1),
('Lemon Sorbet', 1, 1, 1);

-- Insert into Condiments, using IDs from CondimentTypes
INSERT INTO Condiments (Title, Vegetarian, Vegan, InStock, CondimentTypeID) VALUES
('Nutella', 1, 0, 1, (SELECT ID FROM CondimentTypes WHERE Title = 'Sauce')),
('Þristur', 1, 0, 1, (SELECT ID FROM CondimentTypes WHERE Title = 'Candy')),
('Oreo Kurl', 1, 1,  1, (SELECT ID FROM CondimentTypes WHERE Title = 'Candy')),
('Hlaupperlur', 1, 0,  1, (SELECT ID FROM CondimentTypes WHERE Title = 'Candy')),
('Hindber', 1, 1,  1, (SELECT ID FROM CondimentTypes WHERE Title = 'Fruit'));

INSERT INTO Products (Title, SmallPrice, MediumPrice, LargePrice, ChildSizePrice, Description, ImageUrl)
VALUES 
('Bragðarefur', 1000, 1200, 1400, 800, 'Klassíkin sem allir elska', 'bragdarefur.jpeg'),
('Ís í Boxi', 800, 1000, 1200, 600, 'Með eða án nammi, þú ræður', 'isiboxi.jpeg'),
('Sjeik', 1000, 1200, 1400, 800, 'Engin pappaprör hér!', 'sjeik.jpeg');

