SET foreign_key_checks = 0;
DROP TABLE IF EXISTS `customers`;
DROP TABLE IF EXISTS 'instructors';
DROP TABLE IF EXISTS 'classes';
DROP TABLE IF EXISTS 'bookings';
DROP TABLE IF EXISTS 'payments';



CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    membership_type ENUM ('casual', 'monthly', 'annual') DEFAULT 'casual'
)

CREATE TABLE instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15)
    speciality VARCHAR(100)
)

CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    description TEXT,
    instructor_id INT,
    location VARCHAR(100),
    start_time DATETIME,
    end_time DATETIME,
    capacity INT,
    price DECIMAL(6, 2),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
)

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    class_id INT,
    booking_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('booked', 'cancelled', 'completed', 'attended', 'no-show')
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
)

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    booking_id INT,
    amount DECIMAL(6, 2) NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('cash', 'card', 'giftcard'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
)

INSERT INTO customers (first_name, last_name, email, phone, membership_type) VALUES 
('Elif', 'Bayirli', 'elif@gmail.com', 234-343-3423, 'monthly'),
INSERT INTO customers (first_name, last_name, email, phone, membership_type) VALUES 
('Diane', 'Bayirli', 'diane@gmail.com', 834-343-3123, 'monthly'),
INSERT INTO customers (first_name, last_name, email, phone, membership_type) VALUES 
('Darcy', 'Bunron', 'darcy@gmail.com', 934-343-4223, 'annual'),
INSERT INTO customers (first_name, last_name, email, phone, membership_type) VALUES 
('Emma', 'Clarke', 'emma@gmail.com', 134-343-3423, 'monthly'),
INSERT INTO customers (first_name, last_name, email, phone, membership_type) VALUES 
('Hannah', 'Maynard', 'hannah@gmail.com', 994-353-3673, 'casual'),
INSERT INTO customers (first_name, last_name, email, phone, membership_type) VALUES 
('Honey', 'Mustard', 'honey@gmail.com', 267-893-4523, 'casual'),
INSERT INTO customers (first_name, last_name, email, phone, membership_type) VALUES 
('Love', 'Lacey', 'love@gmail.com', 434-433-2373, 'annual'),

INSERT INTO instructors (first_name, last_name, email, phone, speciality) VALUES
('Olivia', 'Brown', 'olivia@gmail.com', 123-664-4563, 'yoga'),
INSERT INTO instructors (first_name, last_name, email, phone, speciality) VALUES
('Sadie', 'Green', 'sadie@gmail.com', 143-677-1233, 'pilates'),
INSERT INTO instructors (first_name, last_name, email, phone, speciality) VALUES
('Ava', 'White', 'ava@gmail.com', 783-774-0965, 'pilates'),

INSERT INTO classes (class_name, description, instructor_id, location, start_time, end_time, capacity, price) VALUES
('Morning Yoga', 'A refreshing morning yoga session to start your day.', 1, 'Studio A', '2025-10-01 07:00:00', '2025-10-01 08:00:00', 20, 15.00),
INSERT INTO classes (class_name, description, instructor_id, location, start_time, end_time, capacity, price) VALUES
('Pilates Plus', 'A challenging pilates class for all levels.', 2, 'Studio B', '2025-10-01 09:00:00', '2025-10-01 10:00:00', 15, 12.00),
INSERT INTO classes (class_name, description, instructor_id, location, start_time, end_time, capacity, price) VALUES
('Evening Yoga', 'A calming evening yoga session to unwind.', 1, 'Studio A', '2025-10-01 18:00:00', '2025-10-01 19:00:00', 20, 15.00),

INSERT INTO bookings (customer_id, class_id, status) VALUES
(1, 1, 'booked'),
INSERT INTO bookings (customer_id, class_id, status) VALUES
(2, 2, 'booked'),
INSERT INTO bookings (customer_id, class_id, status) VALUES
(3, 3, 'booked'),
INSERT INTO bookings (customer_id, class_id, status) VALUES
(4, 1, 'booked'),
INSERT INTO bookings (customer_id, class_id, status) VALUES
(5, 2, 'booked'),
INSERT INTO bookings (customer_id, class_id, status) VALUES
(6, 3, 'booked'),
INSERT INTO bookings (customer_id, class_id, status) VALUES
(7, 1, 'booked'),
INSERT INTO bookings (customer_id, class_id, status) VALUES
(1, 2, 'booked'),
INSERT INTO bookings (customer_id, class_id, status) VALUES
(2, 3, 'booked'),
INSERT INTO bookings (customer_id, class_id, status) VALUES
(3, 1, 'booked'),

INSERT INTO payments (customer_id, booking_id, amount, payment_method) VALUES 
(1, 1, 15.00, 'card'),
INSERT INTO payments (customer_id, booking_id, amount, payment_method) VALUES 
(2, 2, 12.00, 'cash'),
INSERT INTO payments (customer_id, booking_id, amount, payment_method) VALUES 
(3, 3, 15.00, 'giftcard'),
INSERT INTO payments (customer_id, booking_id, amount, payment_method) VALUES 
(4, 4, 15.00, 'card'),
INSERT INTO payments (customer_id, booking_id, amount, payment_method) VALUES 
(5, 5, 12.00, 'cash'),
INSERT INTO payments (customer_id, booking_id, amount, payment_method) VALUES 
(6, 6, 15.00, 'giftcard'),
INSERT INTO payments (customer_id, booking_id, amount, payment_method) VALUES 
(7, 7, 15.00, 'card'),
INSERT INTO payments (customer_id, booking_id, amount, payment_method) VALUES 
(1, 8, 12.00, 'cash'),
INSERT INTO payments (customer_id, booking_id, amount, payment_method) VALUES 
(2, 9, 15.00, 'giftcard'),

