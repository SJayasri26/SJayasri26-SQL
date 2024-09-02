
CREATE DATABASE fooddeliverydb;


USE fooddeliverydb;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20),
    Address TEXT
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St, Springfield'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '123-456-7891', '456 Oak St, Springfield'),
(3, 'Michael', 'Brown', 'michael.brown@example.com', '123-456-7892', '789 Pine St, Springfield'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '123-456-7893', '101 Maple St, Springfield'),
(5, 'David', 'Wilson', 'david.wilson@example.com', '123-456-7894', '202 Birch St, Springfield');


SELECT * FROM Customers;


CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address TEXT,
    CuisineType VARCHAR(50)
);


INSERT INTO Restaurants (RestaurantID, RestaurantName, PhoneNumber, Address, CuisineType) VALUES
(1, 'Pizza Palace', '123-456-1111', '500 Main St, Springfield', 'Italian'),
(2, 'Burger Haven', '123-456-2222', '600 Main St, Springfield', 'American'),
(3, 'Sushi World', '123-456-3333', '700 Main St, Springfield', 'Japanese'),
(4, 'Taco Fiesta', '123-456-4444', '800 Main St, Springfield', 'Mexican'),
(5, 'Curry Corner', '123-456-5555', '900 Main St, Springfield', 'Indian');


SELECT * FROM Restaurants;


CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY,
    RestaurantID INT,
    ItemName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(5, 2),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);


INSERT INTO MenuItems (MenuItemID, RestaurantID, ItemName, Description, Price) VALUES
(1, 1, 'Pepperoni Pizza', 'Classic pepperoni pizza with mozzarella cheese.', 12.99),
(2, 1, 'Margherita Pizza', 'Pizza with fresh tomatoes, mozzarella, and basil.', 11.99),
(3, 2, 'Cheeseburger', 'Burger with cheddar cheese, lettuce, and tomato.', 8.99),
(4, 2, 'Chicken Sandwich', 'Grilled chicken sandwich with mayo and pickles.', 7.99),
(5, 3, 'California Roll', 'Sushi roll with crab, avocado, and cucumber.', 6.99);


SELECT * FROM MenuItems;


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(6, 2),
    DeliveryAddress TEXT,
    OrderStatus VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);


INSERT INTO Orders (OrderID, CustomerID, RestaurantID, TotalAmount, DeliveryAddress, OrderStatus) VALUES
(1, 1, 1, 25.98, '123 Elm St, Springfield', 'Delivered'),
(2, 2, 2, 16.98, '456 Oak St, Springfield', 'Delivered'),
(3, 3, 3, 13.98, '789 Pine St, Springfield', 'In Progress'),
(4, 4, 4, 20.99, '101 Maple St, Springfield', 'Delivered'),
(5, 5, 5, 18.99, '202 Birch St, Springfield', 'Pending');


SELECT * FROM Orders;


CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    MenuItemID INT,
    Quantity INT,
    ItemPrice DECIMAL(5, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);


INSERT INTO OrderItems (OrderItemID, OrderID, MenuItemID, Quantity, ItemPrice) VALUES
(1, 1, 1, 1, 12.99),
(2, 1, 2, 1, 11.99),
(3, 2, 3, 2, 8.99),
(4, 3, 5, 2, 6.99),
(5, 4, 4, 3, 7.99);


SELECT * FROM OrderItems;


CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(20),
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PaymentAmount DECIMAL(6, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Payments (PaymentID, OrderID, PaymentMethod, PaymentAmount) VALUES
(1, 1, 'Credit Card', 25.98),
(2, 2, 'PayPal', 16.98),
(3, 3, 'Credit Card', 13.98),
(4, 4, 'Credit Card', 20.99),
(5, 5, 'Debit Card', 18.99);


SELECT * FROM Payments;


CREATE TABLE DeliveryDrivers (
    DriverID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    PhoneNumber VARCHAR(20),
    VehicleDetails VARCHAR(100)
);


INSERT INTO DeliveryDrivers (DriverID, FirstName, LastName, PhoneNumber, VehicleDetails) VALUES
(1, 'Tom', 'Harrison', '123-456-6666', 'Toyota Corolla'),
(2, 'Lisa', 'Johnson', '123-456-7777', 'Honda Civic'),
(3, 'Jake', 'Parker', '123-456-8888', 'Ford Focus'),
(4, 'Sophie', 'Miller', '123-456-9999', 'Nissan Altima'),
(5, 'Chris', 'Evans', '123-456-0000', 'Chevy Malibu');


SELECT * FROM DeliveryDrivers;


CREATE TABLE Deliveries (
    DeliveryID INT PRIMARY KEY,
    OrderID INT,
    DriverID INT,
    DeliveryStatus VARCHAR(20),
    DeliveredAt DATETIME,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (DriverID) REFERENCES DeliveryDrivers(DriverID)
);


INSERT INTO Deliveries (DeliveryID, OrderID, DriverID, DeliveryStatus, DeliveredAt) VALUES
(1, 1, 1, 'Delivered', '2024-08-01 18:30:00'),
(2, 2, 2, 'Delivered', '2024-08-01 19:00:00'),
(3, 3, 3, 'In Progress', NULL),
(4, 4, 4, 'Delivered', '2024-08-02 12:00:00'),
(5, 5, 5, 'Pending', NULL);


SELECT * FROM Deliveries;


CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    ReviewText TEXT,
    ReviewDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);


INSERT INTO Reviews (ReviewID, CustomerID, RestaurantID, Rating, ReviewText) VALUES
(1, 1, 1, 5, 'Amazing pizza! Will order again.'),
(2, 2, 2, 4, 'Good burgers but could be hotter.'),
(3, 3, 3, 5, 'Fresh sushi, loved it!'),
(4, 4, 4, 3, 'Tacos were a bit dry.'),
(5, 5, 5, 4, 'Great curry, but delivery was late.');


SELECT * FROM Reviews;

CREATE TABLE Coupons (
    CouponID INT PRIMARY KEY,
    CouponCode VARCHAR(20) UNIQUE,
    DiscountPercentage DECIMAL(5, 2),
    ExpiryDate DATE,
    IsActive BOOLEAN DEFAULT TRUE
);


INSERT INTO Coupons (CouponID, CouponCode, DiscountPercentage, ExpiryDate) VALUES
(1, 'SAVE10', 10.00, '2024-12-31'),
(2, 'BURGER20', 20.00, '2024-09-30'),
(3, 'SUSHI15', 15.00, '2024-11-30'),
(4, 'TACO5', 5.00, '2024-10-31'),
(5, 'CURRY25', 25.00, '2024-08-31');


SELECT * FROM Coupons;



CREATE TABLE DriversSchedule (
    ScheduleID INT PRIMARY KEY,
    DriverID INT,
    ShiftStartTime DATETIME,
    ShiftEndTime DATETIME,
    FOREIGN KEY (DriverID) REFERENCES DeliveryDrivers(DriverID)
);


INSERT INTO DriversSchedule (ScheduleID, DriverID, ShiftStartTime, ShiftEndTime) VALUES
(1, 1, '2024-08-01 08:00:00', '2024-08-01 16:00:00'),
(2, 2, '2024-08-01 12:00:00', '2024-08-01 20:00:00'),
(3, 3, '2024-08-02 08:00:00', '2024-08-02 16:00:00'),
(4, 4, '2024-08-02 12:00:00', '2024-08-02 20:00:00'),
(5, 5, '2024-08-03 08:00:00', '2024-08-03 16:00:00');


SELECT * FROM DriversSchedule;


CREATE TABLE RestaurantCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);


INSERT INTO RestaurantCategories (CategoryID, CategoryName) VALUES
(1, 'Italian'),
(2, 'American'),
(3, 'Japanese'),
(4, 'Mexican'),
(5, 'Indian');


SELECT * FROM RestaurantCategories;


CREATE TABLE CustomerFavorites (
    FavoriteID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);


INSERT INTO CustomerFavorites (FavoriteID, CustomerID, RestaurantID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);


SELECT * FROM CustomerFavorites;
