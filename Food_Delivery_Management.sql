-- 1. Customers Table
CREATE TABLE Customers (
    customer_id INT,
    name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(15),
    delivery_address varchar(200),
    registration_date DATE,
    CONSTRAINT c_id PRIMARY KEY(customer_id)
);

-- 2. Restaurants Table
CREATE TABLE Restaurants (
    restaurant_id INT,
    name VARCHAR(255),
    cuisine_type VARCHAR(100),
    address VARCHAR(200),
    contact_number VARCHAR(15),
    open_time TIMESTAMP,
    close_time TIMESTAMP,
    CONSTRAINT r_id PRIMARY KEY(restaurant_id)
);

-- 3. Food_Items Table
CREATE TABLE FoodItems (
    food_id INT,
    restaurant_id INT,
    food_name VARCHAR(255),
    price DECIMAL(10, 2),
    CONSTRAINT f_id PRIMARY KEY(food_id),
    CONSTRAINT f_r_id FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

-- 4. Orders Table
CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    restaurant_id INT,
    order_date DATE,
    delivery_time_estimate TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20),
    CONSTRAINT o_or_id PRIMARY KEY(order_id),
    CONSTRAINT o_c_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT o_r_id FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
 
-- 5. Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT, 
    order_id INT,         
    food_id INT,          
    quantity INT,         
    price DECIMAL(10, 2),
    CONSTRAINT ot_oi_id PRIMARY KEY(order_item_id),
    CONSTRAINT ot_o_id FOREIGN KEY (order_id) REFERENCES Orders(order_id), 
    CONSTRAINT otf_id FOREIGN KEY (food_id) REFERENCES FoodItems(food_id) 
);

-- 6. Payments Table
CREATE TABLE Payments (
    payment_id INT,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    CONSTRAINT p_id PRIMARY KEY(payment_id),
    CONSTRAINT p_o_id FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 7. Delivery_Personnel Table
CREATE TABLE Delivery_Personnel (
    delivery_id INT,
    name VARCHAR(255),
    contact_number VARCHAR(15),
    vehicle_type VARCHAR(50),
    rating DECIMAL(3, 2),
    status VARCHAR(20),
    CONSTRAINT dp_id PRIMArY KEY(delivery_id)
);

-- 8. Deliveries Table
CREATE TABLE Deliveries (
    delivery_id INT,
    order_id INT,
    delivery_personnel_id INT,
    delivery_start_time TIMESTAMP,
    delivery_end_time TIMESTAMP,
    delivery_status VARCHAR(20),
    CONSTRAINT d_d_id PRIMARY KEY(delivery_id),
    CONSTRAINT d_o_id FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    CONSTRAINT d_dp_id FOREIGN KEY (delivery_personnel_id) REFERENCES Delivery_Personnel(delivery_id)
);


--Customer_Ratings Table
CREATE TABLE Customer_Ratings (
    rating_id INT,
    customer_id INT,
    order_id INT,
    rating INT,
    comments VARCHAR(100),
    rating_date DATE,
    CONSTRAINT cr_ra_id PRIMARY KEY(rating_id),
    CONSTRAINT cr_c_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT cr_O_id FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

--customers

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (1, 'John Smith', 'john.smith@example.com', '1234567890', '123 Elm St, City A', TO_DATE('2024-01-10', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (2, 'Alice Johnson', 'alice.johnson@example.com', '2345678901', '456 Maple Ave, City B', TO_DATE('2024-01-12', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (3, 'Bob Williams', 'bob.williams@example.com', '3456789012', '789 Oak Rd, City C', TO_DATE('2024-02-15', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (4, 'Charlie Brown', 'charlie.brown@example.com', '4567890123', '101 Pine St, City D', TO_DATE('2024-02-18', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (5, 'David Martinez', 'david.martinez@example.com', '5678901234', '202 Birch Ln, City E', TO_DATE('2024-03-20', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (6, 'Eve Davis', 'eve.davis@example.com', '6789012345', '303 Cedar Dr, City F', TO_DATE('2024-03-25', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (7, 'Grace Moore', 'grace.moore@example.com', '7890123456', '404 Willow St, City G', TO_DATE('2024-04-01', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (8, 'Hank Miller', 'hank.miller@example.com', '8901234567', '505 Redwood Ave, City H', TO_DATE('2024-04-10', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (9, 'Ivy Clark', 'ivy.clark@example.com', '9012345678', '606 Sequoia Blvd, City I', TO_DATE('2024-05-05', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (10, 'Jack Lee', 'jack.lee@example.com', '0123456789', '707 Oakwood Rd, City J', TO_DATE('2024-05-15', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (11, 'Kate Adams', 'kate.adams@example.com', '1112223334', '808 Birchwood Ct, City K', TO_DATE('2024-06-01', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (12, 'Liam Green', 'liam.green@example.com', '2223334445', '909 Aspen Dr, City L', TO_DATE('2024-06-12', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (13, 'Mia Parker', 'mia.parker@example.com', '3334445556', '1010 Palm St, City M', TO_DATE('2024-07-04', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (14, 'Noah Turner', 'noah.turner@example.com', '4445556667', '1111 Cypress Ave, City N', TO_DATE('2024-07-15', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (15, 'Olivia Scott', 'olivia.scott@example.com', '5556667778', '1212 Magnolia Blvd, City O', TO_DATE('2024-08-01', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (16, 'Paul Young', 'paul.young@example.com', '6667778889', '1313 Spruce Ln, City P', TO_DATE('2024-08-10', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (17, 'Quinn Reed', 'quinn.reed@example.com', '7778889990', '1414 Chestnut St, City Q', TO_DATE('2024-09-01', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (18, 'Rachel Hall', 'rachel.hall@example.com', '8889990001', '1515 Sycamore Dr, City R', TO_DATE('2024-09-12', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (19, 'Sam Wright', 'sam.wright@example.com', '9990001112', '1616 Laurel Ave, City S', TO_DATE('2024-10-01', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (20, 'Tina Evans', 'tina.evans@example.com', '0001112223', '1717 Hazelwood Ct, City T', TO_DATE('2024-10-12', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (21, 'Uma Harris', 'uma.harris@example.com', '1239876543', '1818 Poplar Rd, City U', TO_DATE('2024-11-01', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (22, 'Victor King', 'victor.king@example.com', '2348765432', '1919 Alder St, City V', TO_DATE('2024-11-10', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (23, 'Willow Brooks', 'willow.brooks@example.com', '3457654321', '2020 Walnut Ave, City W', TO_DATE('2024-11-15', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (24, 'Xander Cruz', 'xander.cruz@example.com', '4566543210', '2121 Hickory Ln, City X', TO_DATE('2024-11-20', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (25, 'Yara Foster', 'yara.foster@example.com', '5675432109', '2222 Pinecone Ct, City Y', TO_DATE('2024-11-25', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (26, 'Zara Walker', 'zara.walker@example.com', '6784321098', '2323 Maplewood Dr, City Z', TO_DATE('2024-12-01', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (27, 'Amber Cole', 'amber.cole@example.com', '7893210987', '2424 Birch Grove, City AA', TO_DATE('2024-12-05', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (28, 'Brian Hunt', 'brian.hunt@example.com', '8902109876', '2525 Willow Way, City BB', TO_DATE('2024-12-10', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (29, 'Carly Dean', 'carly.dean@example.com', '9010987654', '2626 Redwood Blvd, City CC', TO_DATE('2024-12-15', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (30, 'Derek Lowe', 'derek.lowe@example.com', '0129876543', '2727 Sequoia Ct, City DD', TO_DATE('2024-12-20', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (31, 'Ella Tate', 'ella.tate@example.com', '1238765432', '2828 Oakwood St, City EE', TO_DATE('2024-12-25', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (32, 'Frank Nash', 'frank.nash@example.com', '2347654321', '2929 Cedar Grove, City FF', TO_DATE('2024-12-30', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (33, 'Gina Owen', 'gina.owen@example.com', '3456543210', '3030 Aspen Ln, City GG', TO_DATE('2025-01-05', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (34, 'Harry Patel', 'harry.patel@example.com', '4565432109', '3131 Palm Blvd, City HH', TO_DATE('2025-01-10', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (35, 'Irene Quinn', 'irene.quinn@example.com', '5674321098', '3232 Spruce Ct, City II', TO_DATE('2025-01-15', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (36, 'Jake Ross', 'jake.ross@example.com', '6783210987', '3333 Chestnut Way, City JJ', TO_DATE('2025-01-20', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (37, 'Kelly Shaw', 'kelly.shaw@example.com', '7892109876', '3434 Magnolia Grove, City KK', TO_DATE('2025-01-25', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (38, 'Lila Vega', 'lila.vega@example.com', '8901098765', '3535 Sycamore St, City LL', TO_DATE('2025-02-01', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (39, 'Mason Webb', 'mason.webb@example.com', '9010987654', '3636 Laurel Blvd, City MM', TO_DATE('2025-02-05', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (40, 'Nina York', 'nina.york@example.com', '0129876543', '3737 Hazelwood Ln, City NN', TO_DATE('2025-02-10', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (41, 'Owen Zane', 'owen.zane@example.com', '1238765432', '3838 Poplar Way, City OO', TO_DATE('2025-02-15', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (42, 'Paula Ray', 'paula.ray@example.com', '2347654321', '3939 Alder Grove, City PP', TO_DATE('2025-02-20', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (43, 'Quincy Lane', 'quincy.lane@example.com', '3456543210', '4040 Walnut Ct, City QQ', TO_DATE('2025-02-25', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (44, 'Rose Grant', 'rose.grant@example.com', '4565432109', '4141 Hickory Grove, City RR', TO_DATE('2025-03-01', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (45, 'Steven Blake', 'steven.blake@example.com', '5674321098', '4242 Pinecone Blvd, City SS', TO_DATE('2025-03-05', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (46, 'Tara Collins', 'tara.collins@example.com', '6783210987', '4343 Birchwood Grove, City TT', TO_DATE('2025-03-10', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (47, 'Ursula Brown', 'ursula.brown@example.com', '7892109876', '4444 Maple Grove, City UU', TO_DATE('2025-03-15', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (48, 'Victor Yang', 'victor.yang@example.com', '8901098765', '4545 Redwood St, City VV', TO_DATE('2025-03-20', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (49, 'Wanda Fox', 'wanda.fox@example.com', '9010987654', '4646 Sequoia Way, City WW', TO_DATE('2025-03-25', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (50, 'Xena Hale', 'xena.hale@example.com', '0129876543', '4747 Oakwood Grove, City XX', TO_DATE('2025-03-30', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (51, 'Yvonne Knight', 'yvonne.knight@example.com', '1236547890', '4848 Pine St, City YY', TO_DATE('2025-04-05', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (52, 'Zane Carter', 'zane.carter@example.com', '2347658901', '4949 Oak Rd, City ZZ', TO_DATE('2025-04-10', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (53, 'Aidan Russell', 'aidan.russell@example.com', '3458769012', '5050 Maple Ave, City AAA', TO_DATE('2025-04-15', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (54, 'Beatrice Grant', 'beatrice.grant@example.com', '4569870123', '5151 Cedar Blvd, City BBB', TO_DATE('2025-04-20', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (55, 'Caleb Price', 'caleb.price@example.com', '5670981234', '5252 Birch St, City CCC', TO_DATE('2025-04-25', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (56, 'Diana Bell', 'diana.bell@example.com', '6782092345', '5353 Redwood Ln, City DDD', TO_DATE('2025-04-30', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (57, 'Ethan Taylor', 'ethan.taylor@example.com', '7893203456', '5454 Pinecone Blvd, City EEE', TO_DATE('2025-05-05', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (58, 'Fiona Morgan', 'fiona.morgan@example.com', '8904314567', '5555 Oakwood Dr, City FFF', TO_DATE('2025-05-10', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (59, 'Gabriel Martin', 'gabriel.martin@example.com', '9015425678', '5656 Cedar Ave, City GGG', TO_DATE('2025-05-15', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (60, 'Hannah Wilson', 'hannah.wilson@example.com', '0126536789', '5757 Maplewood Dr, City HHH', TO_DATE('2025-05-20', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (61, 'Isaiah Cooper', 'isaiah.cooper@example.com', '1237647890', '5858 Birchwood Ln, City III', TO_DATE('2025-05-25', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (62, 'Julia Foster', 'julia.foster@example.com', '2348758901', '5959 Sequoia Blvd, City JJJ', TO_DATE('2025-06-01', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (63, 'Kevin Diaz', 'kevin.diaz@example.com', '3459869012', '6060 Oakwood St, City KKK', TO_DATE('2025-06-05', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (64, 'Lily Harris', 'lily.harris@example.com', '4560970123', '6161 Pine Ln, City LLL', TO_DATE('2025-06-10', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (65, 'Matthew Lewis', 'matthew.lewis@example.com', '5672081234', '6262 Redwood Ave, City MMM', TO_DATE('2025-06-15', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (66, 'Natalie Walker', 'natalie.walker@example.com', '6783192345', '6363 Birch Blvd, City NNN', TO_DATE('2025-06-20', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (67, 'Oscar Scott', 'oscar.scott@example.com', '7894303456', '6464 Maple Rd, City OOO', TO_DATE('2025-06-25', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (68, 'Paige Young', 'paige.young@example.com', '8905414567', '6565 Oakwood Blvd, City PPP', TO_DATE('2025-07-01', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (69, 'Quinton Moore', 'quinton.moore@example.com', '9016525678', '6666 Cedar Dr, City QQQ', TO_DATE('2025-07-05', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (70, 'Riley Clark', 'riley.clark@example.com', '0127636789', '6767 Sequoia Ln, City RRR', TO_DATE('2025-07-10', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (71, 'Samantha Lee', 'samantha.lee@example.com', '1238747890', '6868 Redwood Blvd, City SSS', TO_DATE('2025-07-15', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (72, 'Thomas Wright', 'thomas.wright@example.com', '2349858901', '6969 Maple Dr, City TTT', TO_DATE('2025-07-20', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (73, 'Ulysses Hall', 'ulysses.hall@example.com', '3450969012', '7070 Pinewood Rd, City UUU', TO_DATE('2025-07-25', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (74, 'Veronica Green', 'veronica.green@example.com', '4562070123', '7171 Oak Blvd, City VVV', TO_DATE('2025-07-30', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (75, 'William Adams', 'william.adams@example.com', '5673181234', '7272 Birchwood Ave, City WWW', TO_DATE('2025-08-04', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (76, 'Xena Quinn', 'xena.quinn@example.com', '6784292345', '7373 Sequoia Ct, City XXX', TO_DATE('2025-08-09', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (77, 'Yusuf Green', 'yusuf.green@example.com', '7895403456', '7474 Oakwood Ln, City YYY', TO_DATE('2025-08-14', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (78, 'Zoe Clark', 'zoe.clark@example.com', '8906514567', '7575 Pine Dr, City ZZZ', TO_DATE('2025-08-19', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (79, 'Aaron Mitchell', 'aaron.mitchell@example.com', '9017625678', '7676 Cedar Blvd, City AAAA', TO_DATE('2025-08-24', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (80, 'Bethany Mitchell', 'bethany.mitchell@example.com', '0128736789', '7777 Redwood St, City BBBB', TO_DATE('2025-08-29', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (81, 'Cameron Davis', 'cameron.davis@example.com', '1239847890', '7878 Oakwood Blvd, City CCCC', TO_DATE('2025-09-03', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (82, 'Diana Moore', 'diana.moore@example.com', '2340958901', '7979 Pinewood Rd, City DDDD', TO_DATE('2025-09-08', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (83, 'Ethan Wright', 'ethan.wright@example.com', '3451069012', '8080 Maple Ave, City EEEE', TO_DATE('2025-09-13', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (84, 'Fayla Johnson', 'fayla.johnson@example.com', '4562170123', '8181 Birchwood Dr, City FFFF', TO_DATE('2025-09-18', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (85, 'Gavin Brown', 'gavin.brown@example.com', '5673281234', '8282 Sequoia Blvd, City GGGG', TO_DATE('2025-09-23', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (86, 'Hannah Lee', 'hannah.lee@example.com', '6784392345', '8383 Oakwood Ln, City HHHH', TO_DATE('2025-09-28', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (87, 'Ivy King', 'ivy.king@example.com', '7895403456', '8484 Pinewood Rd, City IIII', TO_DATE('2025-10-03', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (88, 'Jack Turner', 'jack.turner@example.com', '8906514567', '8585 Cedar St, City JJJJ', TO_DATE('2025-10-08', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (89, 'Kimberly Adams', 'kimberly.adams@example.com', '9017625678', '8686 Maple Grove, City KKKK', TO_DATE('2025-10-13', 'YYYY-MM-DD'));

INSERT INTO Customers (customer_id, name, email, phone_number, delivery_address, registration_date) 
VALUES (90, 'Liam White', 'liam.white@example.com', '0128736789', '8787 Sequoia Blvd, City LLLL', TO_DATE('2025-10-18', 'YYYY-MM-DD'));

--Restaurant

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (1, 'Pizza Palace', 'Italian', '123 Pizza Blvd', '123-111-1111', TO_TIMESTAMP('11:00 AM', 'HH:MI AM'), TO_TIMESTAMP('11:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (2, 'Sushi World', 'Japanese', '456 Sushi St.', '234-222-2222', TO_TIMESTAMP('10:00 AM', 'HH:MI AM'), TO_TIMESTAMP('10:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (3, 'Burger King', 'American', '789 Burger Dr.', '345-333-3333', TO_TIMESTAMP('09:00 AM', 'HH:MI AM'), TO_TIMESTAMP('09:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (4, 'Curry House', 'Indian', '321 Curry Ln', '456-444-4444', TO_TIMESTAMP('11:00 AM', 'HH:MI AM'), TO_TIMESTAMP('11:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (5, 'Taco Town', 'Mexican', '567 Taco Rd.', '567-555-5555', TO_TIMESTAMP('10:00 AM', 'HH:MI AM'), TO_TIMESTAMP('10:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (6, 'Dim Sum Delight', 'Chinese', '678 Dim Sum Blvd', '678-666-7777', TO_TIMESTAMP('09:30 AM', 'HH:MI AM'), TO_TIMESTAMP('10:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (7, 'Barbecue Pit', 'American', '789 Barbecue Ave', '789-777-8888', TO_TIMESTAMP('12:00 PM', 'HH:MI AM'), TO_TIMESTAMP('12:00 AM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (8, 'Mediterranean Magic', 'Mediterranean', '890 Olive St.', '890-888-9999', TO_TIMESTAMP('10:30 AM', 'HH:MI AM'), TO_TIMESTAMP('10:30 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (9, 'Pasta Pizzazz', 'Italian', '1234 Pasta Pkwy', '123-999-0000', TO_TIMESTAMP('11:30 AM', 'HH:MI AM'), TO_TIMESTAMP('11:30 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (10, 'Seafood Sanctuary', 'Seafood', '2345 Ocean Ave', '234-000-1111', TO_TIMESTAMP('10:00 AM', 'HH:MI AM'), TO_TIMESTAMP('10:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (11, 'Steakhouse Supreme', 'American', '3456 Steak St.', '345-111-2222', TO_TIMESTAMP('12:00 PM', 'HH:MI AM'), TO_TIMESTAMP('12:00 AM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (12, 'Korean BBQ', 'Korean', '4567 BBQ Rd.', '456-222-3333', TO_TIMESTAMP('11:00 AM', 'HH:MI AM'), TO_TIMESTAMP('11:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (13, 'Biryani House', 'Indian', '5678 Biryani Blvd', '567-333-4444', TO_TIMESTAMP('10:30 AM', 'HH:MI AM'), TO_TIMESTAMP('10:30 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (14, 'French Bistro', 'French', '6789 Paris Ave', '678-444-5555', TO_TIMESTAMP('09:00 AM', 'HH:MI AM'), TO_TIMESTAMP('09:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (15, 'Poke Bowl Paradise', 'Hawaiian', '7890 Aloha St.', '789-555-6666', TO_TIMESTAMP('10:00 AM', 'HH:MI AM'), TO_TIMESTAMP('10:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (16, 'Salsa Salsa', 'Mexican', '8901 Fiesta Blvd', '890-666-7777', TO_TIMESTAMP('12:00 PM', 'HH:MI AM'), TO_TIMESTAMP('12:00 AM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (17, 'Noodle Nirvana', 'Asian', '9012 Noodle Rd.', '901-777-8888', TO_TIMESTAMP('11:00 AM', 'HH:MI AM'), TO_TIMESTAMP('11:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (18, 'Vegan Vibes', 'Vegan', '987 Green Street', '678-123-4567', TO_TIMESTAMP('08:00 AM', 'HH:MI AM'), TO_TIMESTAMP('08:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (19, 'Pasta Palace', 'Italian', '123 Pasta Ave', '123-333-4444', TO_TIMESTAMP('11:00 AM', 'HH:MI AM'), TO_TIMESTAMP('11:00 PM', 'HH:MI AM'));

INSERT INTO Restaurants (restaurant_id, name, cuisine_type, address, contact_number, open_time, close_time) 
VALUES (20, 'Ramen Street', 'Japanese', '543 Ramen Rd.', '234-444-5555', TO_TIMESTAMP('10:00 AM', 'HH:MI AM'), TO_TIMESTAMP('10:00 PM', 'HH:MI AM'));

--Food Item

INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (1, 1, 'Margherita Pizza', 12.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (1, 2, 'Pepperoni Pizza', 14.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (1, 3, 'Mushroom Pizza', 13.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (1, 4, 'Hawaiian Pizza', 15.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (1, 5, 'Vegetarian Pizza', 13.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (1, 6, 'BBQ Chicken Pizza', 16.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (1, 7, 'Four Cheese Pizza', 17.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (1, 8, 'Meat Lovers Pizza', 18.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (1, 9, 'Buffalo Chicken Pizza', 16.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (2, 10, 'California Roll', 10.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (2, 11, 'Spicy Tuna Roll', 12.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (2, 12, 'Dragon Roll', 14.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (2, 13, 'Eel Roll', 13.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (2, 14, 'Shrimp Tempura Roll', 15.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (2, 15, 'Salmon Sashimi', 11.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (2, 16, 'Tuna Sashimi', 12.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (2, 17, 'Miso Soup', 5.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (2, 18, 'Edamame', 4.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (3, 19, 'Cheeseburger', 8.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (3, 20, 'Bacon Cheeseburger', 10.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (3, 21, 'Veggie Burger', 9.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (3, 22, 'Double Cheeseburger', 11.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (3, 23, 'Chicken Sandwich', 10.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (3, 24, 'Onion Rings', 3.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (3, 25, 'French Fries', 2.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (3, 26, 'Milkshake', 4.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (3, 27, 'Apple Pie', 1.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (4, 28, 'Butter Chicken', 12.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (4, 29, 'Chicken Tikka Masala', 14.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (4, 30, 'Palak Paneer', 11.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (4, 31, 'Lamb Curry', 16.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (4, 32, 'Aloo Gobi', 10.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (4, 33, 'Naan Bread', 2.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (4, 34, 'Samosa', 4.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (4, 35, 'Raita', 3.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (4, 36, 'Lassi', 5.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (5, 37, 'Taco', 2.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (5, 38, 'Burrito', 7.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (5, 39, 'Quesadilla', 6.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (5, 40, 'Nachos', 5.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (5, 41, 'Fajitas', 9.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (5, 42, 'Guacamole', 3.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (5, 43, 'Churros', 4.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (5, 44, 'Carnitas', 8.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (5, 45, 'Enchiladas', 10.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 46, 'BBQ Ribs', 18.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 47, 'Pulled Pork Sandwich', 10.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 48, 'Brisket', 16.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 49, 'Smoked Sausages', 12.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 50, 'Mac and Cheese', 5.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 51, 'Cornbread', 3.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 52, 'Coleslaw', 2.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 53, 'BBQ Chicken', 14.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 54, 'Potato Salad', 4.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 55, 'Pulled Chicken', 13.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 56, 'Grilled Shrimp', 15.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 57, 'Steak', 19.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (6, 58, 'BBQ Brisket Sandwich', 11.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (7, 59, 'Ramen', 9.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (7, 60, 'Tonkotsu Ramen', 12.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (7, 61, 'Shoyu Ramen', 11.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (7, 62, 'Miso Ramen', 10.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (7, 63, 'Chashu Pork', 6.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (7, 64, 'Gyoza', 4.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (7, 65, 'Tonkotsu Broth', 8.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (7, 66, 'Seafood Ramen', 13.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (7, 67, 'Spicy Miso Ramen', 11.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (8, 68, 'Fish and Chips', 14.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (8, 69, 'ShepherdPie', 15.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (8, 70, 'Bangers and Mash', 13.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (8, 71, 'Full English Breakfast', 12.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (8, 72, 'Ploughman', 11.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (8, 73, 'Cornish Pasty', 8.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (8, 74, 'Toad in the Hole', 10.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (8, 75, 'Sticky Toffee Pudding', 5.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (8, 76, 'Spotted Dick', 4.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (9, 77, 'Chicken Parmesan', 16.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (9, 78, 'Eggplant Parmesan', 14.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (9, 79, 'Lasagna', 18.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (9, 80, 'Spaghetti Bolognese', 15.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (9, 81, 'Fettuccine Alfredo', 17.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (9, 82, 'Penne Arrabbiata', 14.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (9, 83, 'Marinara Pizza', 13.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (9, 84, 'Caprese Salad', 7.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (9, 85, 'Bruschetta', 6.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (10, 86, 'Peking Duck', 20.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (10, 87, 'Kung Pao Chicken', 12.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (10, 88, 'Mapo Tofu', 11.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (10, 89, 'Sweet and Sour Pork', 13.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (10, 90, 'Dim Sum', 7.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (10, 91, 'Hot and Sour Soup', 5.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (10, 92, 'Spring Rolls', 4.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (10, 93, 'Fried Rice', 8.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (10, 94, 'Lo Mein', 9.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (10, 95, 'Char Siu Bao', 6.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (10, 96, 'Beef Chow Fun', 11.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (10, 97, 'Crispy Duck', 22.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (11, 98, 'Sushi Roll', 14.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (11, 99, 'Nigiri', 12.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (11, 100, 'Sashimi', 15.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (11, 101, 'Tuna Tartare', 16.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (11, 102, 'Maki Roll', 10.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (11, 103, 'Tempura', 9.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (11, 104, 'Edamame', 5.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (11, 105, 'Seaweed Salad', 7.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (11, 106, 'Unagi Don', 18.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (12, 107, 'Burrito', 9.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (12, 108, 'Taco', 3.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (12, 109, 'Quesadilla', 7.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (12, 110, 'Enchiladas', 10.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (12, 111, 'Nachos', 8.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (12, 112, 'Guacamole', 5.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (12, 113, 'Churros', 4.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (12, 114, 'Fajitas', 12.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (12, 115, 'Ceviche', 9.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (13, 116, 'Falafel', 6.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (13, 117, 'Hummus', 5.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (13, 118, 'Shawarma', 9.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (13, 119, 'Grilled Chicken Kebab', 12.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (13, 120, 'Lamb Kebab', 14.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (13, 121, 'Tabbouleh', 7.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (13, 122, 'Baklava', 4.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (13, 123, 'Baba Ganoush', 6.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (14, 124, 'Burger', 10.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (14, 125, 'Cheeseburger', 11.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (14, 126, 'Veggie Burger', 9.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (14, 127, 'Chicken Burger', 12.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (14, 128, 'Fries', 3.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (14, 129, 'Onion Rings', 4.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (14, 130, 'Milkshake', 5.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (14, 131, 'Coleslaw', 2.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (14, 132, 'Chicken Tenders', 8.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (15, 133, 'Pho', 12.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (15, 134, 'Bánh Mì', 8.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (15, 135, 'Spring Rolls', 5.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (15, 136, 'Com tam', 9.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (15, 137, 'Beef Noodle Soup', 11.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (15, 138, 'Grilled Pork', 10.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (15, 139, 'Rice Paper Rolls', 6.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (15, 140, 'Cà Phê Sữa Đá', 3.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (16, 141, 'Fish Tacos', 7.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (16, 142, 'Grilled Fish', 12.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (16, 143, 'Seafood Paella', 18.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (16, 144, 'Clams', 8.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (16, 145, 'Lobster Roll', 20.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (16, 146, 'Ceviche', 9.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (16, 147, 'Shrimp Cocktail', 11.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (16, 148, 'Fish and Chips', 13.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (17, 149, 'Chili Cheese Fries', 6.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (17, 150, 'Pulled Pork Sandwich', 10.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (17, 151, 'Brisket', 12.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (17, 152, 'Ribs', 14.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (17, 153, 'Mac and Cheese', 7.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (17, 154, 'Cornbread', 3.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (17, 155, 'BBQ Chicken', 11.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (17, 156, 'Grilled Vegetables', 5.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (18, 157, 'Crispy Pork Belly', 13.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (18, 158, 'Duck Confit', 18.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (18, 159, 'Foie Gras', 22.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (18, 160, 'Escargots', 12.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (18, 161, 'Beef Wellington', 25.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (18, 162, 'Moules Marinières', 14.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (18, 163, 'Quiche Lorraine', 9.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (18, 164, 'Ratatouille', 11.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (18, 165, 'Tarte Tatin', 6.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (19, 166, 'Sushi Rolls', 9.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (19, 167, 'Nigiri', 12.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (19, 168, 'Tempura', 8.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (19, 169, 'Ramen', 11.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (19, 170, 'Unagi Don', 13.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (19, 171, 'Takoyaki', 7.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (19, 172, 'Edamame', 4.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (19, 173, 'Miso Soup', 3.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (19, 174, 'Gyoza', 5.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (20, 175, 'Burgers', 10.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (20, 176, 'Fries', 3.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (20, 177, 'Milkshakes', 5.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (20, 178, 'Chicken Nuggets', 6.99);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (20, 179, 'Onion Rings', 4.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (20, 180, 'Hot Dog', 7.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (20, 181, 'Veggie Burger', 9.49);
INSERT INTO FoodItems (restaurant_id, food_id, food_name, price) VALUES (20, 182, 'Cheese Fries', 5.99);

--orders

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(1, 56, 14, TO_DATE('2024-12-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-01 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 25.50, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(2, 34, 2, TO_DATE('2024-12-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-02 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 32.00, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(3, 78, 5, TO_DATE('2024-12-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-03 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 45.20, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(4, 90, 8, TO_DATE('2024-12-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 30.75, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(5, 22, 12, TO_DATE('2024-12-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-05 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), 18.50, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(6, 65, 1, TO_DATE('2024-12-06', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-06 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), 27.00, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(7, 10, 17, TO_DATE('2024-12-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-07 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 21.80, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(8, 32, 3, TO_DATE('2024-12-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-08 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 38.00, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(9, 51, 6, TO_DATE('2024-12-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-09 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 25.20, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(10, 11, 11, TO_DATE('2024-12-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-10 19:15:00', 'YYYY-MM-DD HH24:MI:SS'), 19.40, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(11, 19, 4, TO_DATE('2024-12-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-11 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), 28.00, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(12, 64, 7, TO_DATE('2024-12-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-12 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 42.00, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(13, 49, 19, TO_DATE('2024-12-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-13 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 30.50, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(14, 72, 13, TO_DATE('2024-12-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-14 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26.90, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(15, 35, 15, TO_DATE('2024-12-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-15 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 32.00, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(16, 43, 16, TO_DATE('2024-12-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-16 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), 21.75, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(17, 86, 9, TO_DATE('2024-12-17', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-17 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 28.90, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(18, 23, 14, TO_DATE('2024-12-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-18 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 19.30, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(19, 66, 5, TO_DATE('2024-12-19', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-19 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 40.25, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(20, 33, 3, TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 27.40, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(21, 58, 10, TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-21 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 31.10, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(22, 29, 18, TO_DATE('2024-12-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-22 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 38.50, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(23, 54, 7, TO_DATE('2024-12-23', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-23 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 29.20, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(24, 79, 12, TO_DATE('2024-12-24', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-24 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 33.60, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(25, 71, 6, TO_DATE('2024-12-25', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-25 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 25.80, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(26, 80, 15, TO_DATE('2024-12-26', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-26 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), 35.00, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(27, 41, 2, TO_DATE('2024-12-27', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-27 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 40.00, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(28, 53, 17, TO_DATE('2024-12-28', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-28 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 27.80, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(29, 70, 4, TO_DATE('2024-12-29', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-29 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 22.50, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES 
(30, 42, 8, TO_DATE('2024-12-30', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-30 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 33.10, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(31, 60, 3, TO_DATE('2024-12-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-01 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 24.50, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(32, 72, 14, TO_DATE('2024-12-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 26.75, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(33, 21, 16, TO_DATE('2024-12-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-03 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 35.90, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(34, 77, 7, TO_DATE('2024-12-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-04 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 18.50, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(35, 55, 12, TO_DATE('2024-12-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-05 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 28.40, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(36, 30, 8, TO_DATE('2024-12-06', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-06 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 22.00, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(37, 64, 11, TO_DATE('2024-12-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-07 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 25.20, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(38, 40, 5, TO_DATE('2024-12-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-08 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 34.80, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(39, 15, 2, TO_DATE('2024-12-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-09 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 28.10, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(40, 25, 14, TO_DATE('2024-12-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-10 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 35.10, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(41, 53, 19, TO_DATE('2024-12-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-11 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 29.50, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(42, 66, 3, TO_DATE('2024-12-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-12 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 24.90, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(43, 73, 10, TO_DATE('2024-12-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-13 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 21.00, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(44, 18, 20, TO_DATE('2024-12-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-14 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 30.50, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(45, 40, 6, TO_DATE('2024-12-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 27.30, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(46, 22, 4, TO_DATE('2024-12-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-16 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 31.20, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(47, 49, 17, TO_DATE('2024-12-17', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-17 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 38.00, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(48, 34, 8, TO_DATE('2024-12-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-18 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 27.90, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(49, 69, 2, TO_DATE('2024-12-19', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-19 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 23.60, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(50, 25, 19, TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-20 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 34.90, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(51, 30, 11, TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-21 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 22.80, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(52, 41, 16, TO_DATE('2024-12-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-22 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 26.50, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(53, 54, 15, TO_DATE('2024-12-23', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-23 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), 33.40, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(54, 45, 6, TO_DATE('2024-12-24', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-24 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), 27.80, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(55, 33, 2, TO_DATE('2024-12-25', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-25 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 25.60, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(56, 61, 7, TO_DATE('2024-12-26', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-26 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 28.40, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(57, 67, 3, TO_DATE('2024-12-27', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-27 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 29.20, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(58, 29, 13, TO_DATE('2024-12-28', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-28 18:15:00', 'YYYY-MM-DD HH24:MI:SS'), 21.30, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(59, 50, 18, TO_DATE('2024-12-29', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-29 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 32.50, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(60, 56, 9, TO_DATE('2024-12-30', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-30 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 25.80, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(61, 53, 10, TO_DATE('2024-12-31', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-31 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 30.20, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(62, 38, 14, TO_DATE('2024-12-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-01 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 31.50, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(63, 21, 5, TO_DATE('2024-12-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-02 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 27.90, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(64, 45, 4, TO_DATE('2024-12-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-03 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 33.10, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(65, 60, 19, TO_DATE('2024-12-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-04 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 25.00, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(66, 47, 12, TO_DATE('2024-12-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-05 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 28.40, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(67, 69, 16, TO_DATE('2024-12-06', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-06 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 32.20, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(68, 37, 7, TO_DATE('2024-12-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-07 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), 24.00, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(69, 55, 3, TO_DATE('2024-12-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-08 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 29.10, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(70, 62, 2, TO_DATE('2024-12-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 26.80, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(71, 73, 19, TO_DATE('2024-12-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 27.40, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(72, 58, 13, TO_DATE('2024-12-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-11 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 32.50, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(73, 64, 15, TO_DATE('2024-12-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-12 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 29.60, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(74, 80, 4, TO_DATE('2024-12-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-13 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 30.30, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(75, 50, 11, TO_DATE('2024-12-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-14 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 34.20, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(76, 41, 8, TO_DATE('2024-12-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-15 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 28.90, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(77, 82, 6, TO_DATE('2024-12-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-16 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 30.00, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(78, 39, 17, TO_DATE('2024-12-17', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-17 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 31.70, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(79, 44, 18, TO_DATE('2024-12-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-18 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 33.00, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(80, 72, 9, TO_DATE('2024-12-19', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-19 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), 29.20, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(81, 61, 2, TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-20 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 31.50, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(82, 85, 5, TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-21 18:45:00', 'YYYY-MM-DD HH24:MI:SS'), 35.00, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(83, 77, 16, TO_DATE('2024-12-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-22 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 32.40, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(84, 57, 12, TO_DATE('2024-12-23', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-23 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 29.50, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(85, 46, 19, TO_DATE('2024-12-24', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-24 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 30.70, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(86, 49, 3, TO_DATE('2024-12-25', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-25 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), 28.60, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(87, 40, 20, TO_DATE('2024-12-26', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-26 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 33.10, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(88, 36, 18, TO_DATE('2024-12-27', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-27 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 34.20, 'Delivered');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(89, 82, 11, TO_DATE('2024-12-28', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-28 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 32.50, 'Pending');

INSERT INTO Orders (order_id, customer_id, restaurant_id, order_date, delivery_time_estimate, total_amount, status) VALUES
(90, 90, 13, TO_DATE('2024-12-29', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-29 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 35.00, 'Delivered');

--Order items

INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (1, 1, 3, 2, 15.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (2, 3, 7, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (3, 4, 8, 3, 20.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (4, 2, 12, 2, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (5, 3, 15, 4, 18.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (6, 1, 4, 2, 5.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (7, 6, 1, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (8, 5, 3, 5, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (9, 7, 10, 2, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (10, 8, 6, 3, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (11, 3, 9, 1, 13.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (12, 2, 13, 4, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (13, 5, 5, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (14, 4, 2, 3, 18.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (15, 6, 14, 2, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (16, 7, 16, 1, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (17, 8, 11, 3, 8.79);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (18, 9, 4, 4, 5.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (19, 10, 2, 5, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (20, 11, 8, 3, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (21, 12, 3, 2, 15.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (22, 13, 7, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (23, 14, 8, 3, 20.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (24, 15, 12, 2, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (25, 16, 15, 4, 18.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (26, 17, 4, 2, 5.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (27, 18, 1, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (28, 19, 3, 5, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (29, 20, 10, 2, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (30, 21, 6, 3, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (31, 22, 9, 1, 13.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (32, 23, 13, 4, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (33, 24, 5, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (34, 25, 2, 3, 18.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (35, 26, 14, 2, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (36, 27, 16, 1, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (37, 28, 11, 3, 8.79);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (38, 29, 4, 4, 5.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (39, 30, 2, 5, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (40, 31, 8, 3, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (41, 32, 3, 2, 15.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (42, 33, 7, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (43, 34, 8, 3, 20.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (44, 35, 12, 2, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (45, 36, 15, 4, 18.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (46, 37, 4, 2, 5.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (47, 38, 1, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (48, 39, 3, 5, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (49, 40, 10, 2, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (50, 41, 6, 3, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (51, 42, 9, 1, 13.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (52, 43, 13, 4, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (53, 44, 5, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (54, 45, 2, 3, 18.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (55, 46, 14, 2, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (56, 47, 16, 1, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (57, 48, 11, 3, 8.79);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (58, 49, 4, 4, 5.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (59, 50, 2, 5, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (60, 51, 8, 3, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (61, 52, 3, 2, 15.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (62, 53, 7, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (63, 54, 8, 3, 20.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (64, 55, 12, 2, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (65, 56, 15, 4, 18.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (66, 57, 4, 2, 5.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (67, 58, 1, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (68, 59, 3, 5, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (69, 60, 10, 2, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (70, 61, 6, 3, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (71, 62, 9, 1, 13.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (72, 63, 13, 4, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (73, 64, 5, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (74, 65, 2, 3, 18.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (75, 66, 14, 2, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (76, 67, 16, 1, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (77, 68, 11, 3, 8.79);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (78, 69, 4, 4, 5.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (79, 70, 2, 5, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (80, 71, 8, 3, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (81, 72, 3, 2, 15.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (82, 73, 7, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (83, 74, 8, 3, 20.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (84, 75, 12, 2, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (85, 76, 15, 4, 18.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (86, 77, 4, 2, 5.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (87, 78, 1, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (88, 79, 3, 5, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (89, 80, 10, 2, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (90, 81, 6, 3, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (91, 82, 9, 1, 13.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (92, 83, 13, 4, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (93, 84, 5, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (94, 85, 2, 3, 18.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (95, 86, 14, 2, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (96, 87, 16, 1, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (97, 88, 11, 3, 8.79);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (98, 89, 4, 4, 5.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (99, 90, 2, 5, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (100, 1, 3, 2, 15.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (101, 1, 45, 2, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (102, 2, 12, 3, 15.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (103, 3, 72, 1, 13.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (104, 4, 28, 2, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (105, 5, 56, 3, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (106, 6, 120, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (107, 7, 104, 2, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (108, 8, 91, 1, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (109, 9, 45, 3, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (110, 10, 89, 4, 6.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (111, 11, 11, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (112, 12, 183, 2, 8.79);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (113, 13, 158, 3, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (114, 14, 92, 4, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (115, 15, 101, 2, 15.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (116, 16, 33, 3, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (117, 17, 150, 5, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (118, 18, 70, 1, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (119, 19, 115, 2, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (120, 20, 56, 3, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (121, 21, 123, 1, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (122, 22, 135, 2, 13.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (123, 23, 62, 4, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (124, 24, 87, 1, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (125, 25, 43, 3, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (126, 26, 174, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (127, 27, 28, 5, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (128, 28, 10, 2, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (129, 29, 118, 1, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (130, 30, 69, 3, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (131, 31, 101, 2, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (132, 32, 138, 3, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (133, 33, 39, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (134, 34, 25, 3, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (135, 35, 150, 2, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (136, 36, 180, 3, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (137, 37, 78, 4, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (138, 38, 56, 2, 13.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (139, 39, 91, 3, 8.79);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (140, 40, 120, 1, 14.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (141, 41, 125, 2, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (142, 42, 89, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (143, 43, 91, 3, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (144, 44, 58, 1, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (145, 45, 62, 2, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (146, 46, 74, 3, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (147, 47, 107, 2, 13.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (148, 48, 119, 1, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (149, 49, 150, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (150, 50, 80, 3, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (151, 51, 155, 2, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (152, 52, 116, 3, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (153, 53, 72, 2, 12.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (154, 54, 37, 1, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (155, 55, 168, 3, 13.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (156, 56, 40, 2, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (157, 57, 160, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (158, 58, 71, 2, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (159, 59, 53, 1, 6.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (160, 60, 100, 4, 13.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (161, 61, 45, 3, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (162, 62, 128, 1, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (163, 63, 76, 2, 12.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (164, 64, 110, 1, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (165, 65, 87, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (166, 66, 102, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (167, 67, 162, 3, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (168, 68, 143, 1, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (169, 69, 177, 2, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (170, 70, 54, 3, 13.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (171, 71, 79, 1, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (172, 72, 91, 2, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (173, 73, 135, 3, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (174, 74, 150, 4, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (175, 75, 99, 1, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (176, 76, 104, 2, 12.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (177, 77, 113, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (178, 78, 64, 3, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (179, 79, 47, 2, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (180, 80, 129, 4, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (181, 81, 36, 1, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (182, 82, 117, 2, 13.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (183, 83, 140, 3, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (184, 84, 129, 1, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (185, 85, 142, 2, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (186, 86, 168, 3, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (187, 87, 175, 1, 12.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (188, 88, 84, 2, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (189, 89, 156, 1, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (190, 90, 81, 3, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (191, 1, 49, 2, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (192, 2, 25, 3, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (193, 3, 72, 1, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (194, 4, 99, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (195, 5, 119, 3, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (196, 6, 134, 2, 12.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (197, 7, 57, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (198, 8, 68, 3, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (199, 9, 118, 2, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (200, 10, 132, 1, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (201, 11, 86, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (202, 12, 157, 3, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (203, 13, 135, 2, 12.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (204, 14, 109, 1, 14.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (205, 15, 91, 2, 13.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (206, 16, 55, 3, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (207, 17, 47, 1, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (208, 18, 164, 2, 12.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (209, 19, 29, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (210, 20, 116, 2, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (211, 21, 112, 3, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (212, 22, 140, 2, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (213, 23, 137, 3, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (214, 24, 159, 2, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (215, 25, 133, 1, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (216, 26, 108, 3, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (217, 27, 71, 2, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (218, 28, 74, 1, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (219, 29, 46, 3, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (220, 30, 134, 2, 14.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (221, 31, 111, 1, 13.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (222, 32, 80, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (223, 33, 140, 3, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (224, 34, 131, 2, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (225, 35, 68, 1, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (226, 36, 45, 2, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (227, 37, 91, 3, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (228, 38, 130, 2, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (229, 39, 132, 1, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (230, 40, 149, 2, 13.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (231, 41, 58, 3, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (232, 42, 118, 2, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (233, 43, 55, 1, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (234, 44, 120, 2, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (235, 45, 106, 3, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (236, 46, 133, 1, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (237, 47, 137, 2, 12.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (238, 48, 150, 1, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (239, 49, 124, 3, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (240, 50, 75, 2, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (241, 51, 128, 1, 6.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (242, 52, 109, 3, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (243, 53, 100, 2, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (244, 54, 135, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (245, 55, 147, 3, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (246, 56, 119, 2, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (247, 57, 153, 1, 13.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (248, 58, 136, 2, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (249, 59, 108, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (250, 60, 110, 3, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (251, 61, 59, 2, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (252, 62, 127, 3, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (253, 63, 111, 1, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (254, 64, 83, 2, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (255, 65, 88, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (256, 66, 122, 2, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (257, 67, 96, 3, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (258, 68, 72, 2, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (259, 69, 104, 1, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (260, 70, 103, 2, 13.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (261, 71, 118, 3, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (262, 72, 54, 1, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (263, 73, 96, 2, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (264, 74, 144, 1, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (265, 75, 99, 2, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (266, 76, 104, 3, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (267, 77, 122, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (268, 78, 58, 2, 13.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (269, 79, 112, 1, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (270, 80, 143, 3, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (271, 81, 141, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (272, 82, 117, 1, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (273, 83, 137, 3, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (274, 84, 102, 2, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (275, 85, 74, 1, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (276, 86, 130, 3, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (277, 87, 108, 2, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (278, 88, 122, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (279, 89, 145, 2, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (280, 90, 124, 3, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (281, 1, 118, 1, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (282, 2, 137, 2, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (283, 3, 144, 3, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (284, 4, 128, 1, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (285, 5, 110, 2, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (286, 6, 99, 1, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (287, 7, 101, 3, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (288, 8, 125, 2, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (289, 9, 142, 3, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (290, 10, 135, 1, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (291, 11, 111, 2, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (292, 12, 102, 3, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (293, 13, 145, 1, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (294, 14, 116, 2, 6.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (295, 15, 124, 3, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (296, 16, 79, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (297, 17, 130, 1, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (298, 18, 140, 2, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (299, 19, 105, 3, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (300, 20, 108, 2, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (301, 21, 132, 1, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (302, 22, 118, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (303, 23, 140, 3, 11.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (304, 24, 129, 1, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (305, 25, 113, 2, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (306, 26, 124, 3, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (307, 27, 138, 2, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (308, 28, 114, 3, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (309, 29, 122, 1, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (310, 30, 107, 2, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (311, 31, 130, 1, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (312, 32, 118, 2, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (313, 33, 108, 3, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (314, 34, 132, 1, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (315, 35, 124, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (316, 36, 137, 3, 12.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (317, 37, 142, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (318, 38, 139, 2, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (319, 39, 145, 3, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (320, 40, 120, 1, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (321, 41, 126, 2, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (322, 42, 132, 3, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (323, 43, 116, 1, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (324, 44, 124, 2, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (325, 45, 111, 3, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (326, 46, 122, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (327, 47, 103, 2, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (328, 48, 129, 3, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (329, 49, 137, 1, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (330, 50, 106, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (331, 51, 118, 3, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (332, 52, 125, 1, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (333, 53, 140, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (334, 54, 120, 3, 10.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (335, 55, 121, 1, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (336, 56, 127, 2, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (337, 57, 111, 3, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (338, 58, 128, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (339, 59, 137, 2, 11.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (340, 60, 133, 3, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (341, 61, 122, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (342, 62, 106, 2, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (343, 63, 121, 3, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (344, 64, 118, 1, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (345, 65, 136, 2, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (346, 66, 130, 3, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (347, 67, 109, 1, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (348, 68, 145, 2, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (349, 69, 120, 3, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (350, 70, 123, 1, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (351, 71, 122, 2, 7.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (352, 72, 136, 3, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (353, 73, 118, 1, 6.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (354, 74, 124, 2, 7.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (355, 75, 130, 3, 8.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (356, 76, 140, 1, 9.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (357, 77, 122, 2, 8.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (358, 78, 137, 3, 10.49);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (359, 79, 124, 1, 9.99);
INSERT INTO Order_Items (order_item_id, order_id, food_id, quantity, price) VALUES (360, 80, 110, 2, 8.99);

--payments

INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(1, 25, TO_TIMESTAMP('2024-12-15 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(2, 43, TO_TIMESTAMP('2024-12-15 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(3, 57, TO_TIMESTAMP('2024-12-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(4, 12, TO_TIMESTAMP('2024-12-15 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(5, 6, TO_TIMESTAMP('2024-12-15 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(6, 89, TO_TIMESTAMP('2024-12-15 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(7, 34, TO_TIMESTAMP('2024-12-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(8, 11, TO_TIMESTAMP('2024-12-15 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(9, 22, TO_TIMESTAMP('2024-12-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(10, 53, TO_TIMESTAMP('2024-12-15 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(11, 67, TO_TIMESTAMP('2024-12-15 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(12, 32, TO_TIMESTAMP('2024-12-15 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(13, 54, TO_TIMESTAMP('2024-12-15 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(14, 77, TO_TIMESTAMP('2024-12-15 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(15, 28, TO_TIMESTAMP('2024-12-15 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(16, 50, TO_TIMESTAMP('2024-12-15 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(17, 9, TO_TIMESTAMP('2024-12-15 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(18, 30, TO_TIMESTAMP('2024-12-15 21:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(19, 64, TO_TIMESTAMP('2024-12-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(20, 18, TO_TIMESTAMP('2024-12-15 22:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(21, 74, TO_TIMESTAMP('2024-12-15 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(22, 16, TO_TIMESTAMP('2024-12-15 23:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(23, 38, TO_TIMESTAMP('2024-12-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(24, 69, TO_TIMESTAMP('2024-12-16 00:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(25, 26, TO_TIMESTAMP('2024-12-16 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(26, 59, TO_TIMESTAMP('2024-12-16 01:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(27, 77, TO_TIMESTAMP('2024-12-16 02:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(28, 33, TO_TIMESTAMP('2024-12-16 02:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(29, 52, TO_TIMESTAMP('2024-12-16 03:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(30, 41, TO_TIMESTAMP('2024-12-16 03:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(31, 84, TO_TIMESTAMP('2024-12-16 04:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(32, 19, TO_TIMESTAMP('2024-12-16 04:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(33, 60, TO_TIMESTAMP('2024-12-16 05:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(34, 50, TO_TIMESTAMP('2024-12-16 05:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(35, 70, TO_TIMESTAMP('2024-12-16 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(36, 62, TO_TIMESTAMP('2024-12-16 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(37, 21, TO_TIMESTAMP('2024-12-16 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(38, 56, TO_TIMESTAMP('2024-12-16 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(39, 78, TO_TIMESTAMP('2024-12-16 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(40, 44, TO_TIMESTAMP('2024-12-16 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(41, 67, TO_TIMESTAMP('2024-12-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(42, 22, TO_TIMESTAMP('2024-12-16 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(43, 33, TO_TIMESTAMP('2024-12-16 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(44, 11, TO_TIMESTAMP('2024-12-16 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(45, 53, TO_TIMESTAMP('2024-12-16 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(46, 40, TO_TIMESTAMP('2024-12-16 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(47, 81, TO_TIMESTAMP('2024-12-16 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(48, 25, TO_TIMESTAMP('2024-12-16 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(49, 59, TO_TIMESTAMP('2024-12-16 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(50, 38, TO_TIMESTAMP('2024-12-16 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(51, 76, TO_TIMESTAMP('2024-12-16 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(52, 90, TO_TIMESTAMP('2024-12-16 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(53, 55, TO_TIMESTAMP('2024-12-16 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(54, 23, TO_TIMESTAMP('2024-12-16 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(55, 28, TO_TIMESTAMP('2024-12-16 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(56, 49, TO_TIMESTAMP('2024-12-16 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(57, 68, TO_TIMESTAMP('2024-12-16 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(58, 71, TO_TIMESTAMP('2024-12-16 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(59, 37, TO_TIMESTAMP('2024-12-16 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(60, 56, TO_TIMESTAMP('2024-12-16 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(61, 14, TO_TIMESTAMP('2024-12-16 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(62, 93, TO_TIMESTAMP('2024-12-16 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(63, 82, TO_TIMESTAMP('2024-12-16 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(64, 21, TO_TIMESTAMP('2024-12-16 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(65, 10, TO_TIMESTAMP('2024-12-16 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(66, 89, TO_TIMESTAMP('2024-12-16 21:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(67, 58, TO_TIMESTAMP('2024-12-16 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(68, 69, TO_TIMESTAMP('2024-12-16 22:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(69, 46, TO_TIMESTAMP('2024-12-16 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(70, 60, TO_TIMESTAMP('2024-12-16 23:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(71, 37, TO_TIMESTAMP('2024-12-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(72, 53, TO_TIMESTAMP('2024-12-17 00:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(73, 25, TO_TIMESTAMP('2024-12-17 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(74, 78, TO_TIMESTAMP('2024-12-17 01:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(75, 90, TO_TIMESTAMP('2024-12-17 02:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(76, 41, TO_TIMESTAMP('2024-12-17 02:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(77, 84, TO_TIMESTAMP('2024-12-17 03:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(78, 12, TO_TIMESTAMP('2024-12-17 03:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(79, 59, TO_TIMESTAMP('2024-12-17 04:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(80, 48, TO_TIMESTAMP('2024-12-17 04:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(81, 62, TO_TIMESTAMP('2024-12-17 05:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(82, 18, TO_TIMESTAMP('2024-12-17 05:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(83, 74, TO_TIMESTAMP('2024-12-17 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(84, 55, TO_TIMESTAMP('2024-12-17 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(85, 67, TO_TIMESTAMP('2024-12-17 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(86, 11, TO_TIMESTAMP('2024-12-17 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(87, 70, TO_TIMESTAMP('2024-12-17 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(88, 36, TO_TIMESTAMP('2024-12-17 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(89, 21, TO_TIMESTAMP('2024-12-17 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Credit Card', 'Pending');
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(90, 9, TO_TIMESTAMP('2024-12-17 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'PayPal', 'Completed');

--Delivery personal

INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(1, 'Liam Taylor', '1234567890', 'Car', 4.5, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(2, 'Olivia Brown', '2345678901', 'Bike', 4.7, 'On Delivery');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(3, 'Noah Davis', '3456789012', 'Car', 4.8, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(4, 'Emma Wilson', '4567890123', 'Scooter', 4.4, 'On Break');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(5, 'Oliver Martinez', '5678901234', 'Bike', 4.6, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(6, 'Ava Anderson', '6789012345', 'Car', 4.9, 'On Delivery');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(7, 'Elijah Thomas', '7890123456', 'Scooter', 4.3, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(8, 'Sophia Garcia', '8901234567', 'Bike', 4.5, 'On Break');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(9, 'James Johnson', '9012345678', 'Car', 4.7, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(10, 'Isabella Robinson', '1238904567', 'Scooter', 4.6, 'On Delivery');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(11, 'Lucas Harris', '2349015678', 'Bike', 4.5, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(12, 'Mia Clark', '3450126789', 'Car', 4.8, 'On Delivery');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(13, 'Mason Lewis', '4561237890', 'Scooter', 4.3, 'On Break');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(14, 'Amelia Young', '5672348901', 'Bike', 4.6, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(15, 'Logan Walker', '6783459012', 'Car', 4.9, 'On Delivery');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(16, 'Charlotte Hall', '7894560123', 'Scooter', 4.7, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(17, 'Ethan Allen', '8905671234', 'Bike', 4.8, 'On Break');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(18, 'Harper Scott', '9016782345', 'Car', 4.4, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(19, 'Alexander King', '1237893456', 'Scooter', 4.5, 'On Delivery');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(20, 'Emily Wright', '2348904567', 'Bike', 4.6, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(21, 'Henry Green', '3459015678', 'Car', 4.9, 'On Delivery');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(22, 'Grace Baker', '4560126789', 'Scooter', 4.7, 'On Break');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(23, 'Daniel Adams', '5671237890', 'Bike', 4.8, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(24, 'Victoria Carter', '6782348901', 'Car', 4.5, 'On Delivery');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(25, 'Sebastian Turner', '7893459012', 'Scooter', 4.6, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(26, 'Aria Phillips', '8904560123', 'Bike', 4.3, 'On Break');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(27, 'Matthew Hill', '9015671234', 'Car', 4.4, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(28, 'Ella Bennett', '1236782345', 'Scooter', 4.7, 'On Delivery');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(29, 'William Collins', '2347893456', 'Bike', 4.8, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(30, 'Avery Reed', '3458904567', 'Car', 4.5, 'On Break');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(31, 'Jack Edwards', '4569015678', 'Scooter', 4.9, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(32, 'Scarlett Parker', '5670126789', 'Bike', 4.6, 'On Delivery');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(33, 'Benjamin Stewart', '6781237890', 'Car', 4.7, 'On Break');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(34, 'Zoey Morgan', '7892348901', 'Scooter', 4.8, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(35, 'Michael Bell', '8903459012', 'Bike', 4.5, 'On Delivery');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(36, 'Layla Howard', '9014560123', 'Car', 4.3, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(37, 'Jacob Rogers', '1235671234', 'Scooter', 4.4, 'On Break');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(38, 'Chloe Hughes', '2346782345', 'Bike', 4.6, 'Available');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(39, 'David Brooks', '3457893456', 'Car', 4.9, 'On Delivery');
INSERT INTO Delivery_Personnel (delivery_id, name, contact_number, vehicle_type, rating, status) VALUES
(40, 'Hannah Peterson', '4568904567', 'Scooter', 4.7, 'Available');

--Deliveries

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (1, 45, 19, TO_TIMESTAMP('2024-12-15 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (2, 76, 22, TO_TIMESTAMP('2024-12-15 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (3, 8, 11, TO_TIMESTAMP('2024-12-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (4, 57, 35, TO_TIMESTAMP('2024-12-15 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (5, 20, 9, TO_TIMESTAMP('2024-12-15 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (6, 4, 12, TO_TIMESTAMP('2024-12-15 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (7, 35, 30, TO_TIMESTAMP('2024-12-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (8, 81, 17, TO_TIMESTAMP('2024-12-15 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (9, 62, 8, TO_TIMESTAMP('2024-12-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (10, 53, 23, TO_TIMESTAMP('2024-12-15 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (11, 44, 15, TO_TIMESTAMP('2024-12-15 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (12, 23, 10, TO_TIMESTAMP('2024-12-15 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (13, 37, 24, TO_TIMESTAMP('2024-12-15 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (14, 49, 18, TO_TIMESTAMP('2024-12-15 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (15, 18, 33, TO_TIMESTAMP('2024-12-15 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (16, 59, 1, TO_TIMESTAMP('2024-12-15 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (17, 56, 14, TO_TIMESTAMP('2024-12-15 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 21:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (18, 31, 7, TO_TIMESTAMP('2024-12-15 21:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (19, 65, 40, TO_TIMESTAMP('2024-12-15 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 22:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (20, 43, 5, TO_TIMESTAMP('2024-12-15 22:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (21, 67, 8, TO_TIMESTAMP('2024-12-15 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-15 23:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (22, 17, 13, TO_TIMESTAMP('2024-12-15 23:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (23, 70, 6, TO_TIMESTAMP('2024-12-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 00:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (24, 74, 10, TO_TIMESTAMP('2024-12-16 00:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (25, 54, 4, TO_TIMESTAMP('2024-12-16 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 01:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (26, 85, 2, TO_TIMESTAMP('2024-12-16 01:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 02:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (27, 78, 31, TO_TIMESTAMP('2024-12-16 02:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 02:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (28, 12, 9, TO_TIMESTAMP('2024-12-16 02:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 03:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (29, 56, 26, TO_TIMESTAMP('2024-12-16 03:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 03:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (30, 58, 32, TO_TIMESTAMP('2024-12-16 03:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 04:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (31, 29, 21, TO_TIMESTAMP('2024-12-16 04:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 04:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (32, 68, 12, TO_TIMESTAMP('2024-12-16 04:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 05:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (33, 13, 35, TO_TIMESTAMP('2024-12-16 05:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 05:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (34, 40, 19, TO_TIMESTAMP('2024-12-16 05:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (35, 57, 38, TO_TIMESTAMP('2024-12-16 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (36, 72, 22, TO_TIMESTAMP('2024-12-16 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (37, 22, 16, TO_TIMESTAMP('2024-12-16 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (38, 75, 20, TO_TIMESTAMP('2024-12-16 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (39, 46, 28, TO_TIMESTAMP('2024-12-16 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (40, 24, 39, TO_TIMESTAMP('2024-12-16 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (41, 48, 36, TO_TIMESTAMP('2024-12-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (42, 83, 6, TO_TIMESTAMP('2024-12-16 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (43, 62, 29, TO_TIMESTAMP('2024-12-16 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (44, 61, 17, TO_TIMESTAMP('2024-12-16 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (45, 33, 37, TO_TIMESTAMP('2024-12-16 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (46, 73, 25, TO_TIMESTAMP('2024-12-16 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (47, 71, 8, TO_TIMESTAMP('2024-12-16 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (48, 77, 18, TO_TIMESTAMP('2024-12-16 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (49, 50, 11, TO_TIMESTAMP('2024-12-16 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (50, 28, 27, TO_TIMESTAMP('2024-12-16 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (51, 14, 15, TO_TIMESTAMP('2024-12-16 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (52, 80, 3, TO_TIMESTAMP('2024-12-16 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (53, 63, 33, TO_TIMESTAMP('2024-12-16 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (54, 49, 13, TO_TIMESTAMP('2024-12-16 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (55, 27, 5, TO_TIMESTAMP('2024-12-16 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (56, 69, 30, TO_TIMESTAMP('2024-12-16 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (57, 44, 2, TO_TIMESTAMP('2024-12-16 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (58, 76, 19, TO_TIMESTAMP('2024-12-16 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (59, 55, 4, TO_TIMESTAMP('2024-12-16 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (60, 25, 23, TO_TIMESTAMP('2024-12-16 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (61, 37, 31, TO_TIMESTAMP('2024-12-16 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (62, 53, 9, TO_TIMESTAMP('2024-12-16 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (63, 51, 32, TO_TIMESTAMP('2024-12-16 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (64, 58, 7, TO_TIMESTAMP('2024-12-16 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (65, 64, 14, TO_TIMESTAMP('2024-12-16 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 21:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (66, 60, 1, TO_TIMESTAMP('2024-12-16 21:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (67, 30, 25, TO_TIMESTAMP('2024-12-16 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 22:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (68, 35, 20, TO_TIMESTAMP('2024-12-16 22:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (69, 56, 12, TO_TIMESTAMP('2024-12-16 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-16 23:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (70, 38, 34, TO_TIMESTAMP('2024-12-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 00:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (71, 45, 3, TO_TIMESTAMP('2024-12-17 00:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (72, 70, 16, TO_TIMESTAMP('2024-12-17 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 01:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (73, 59, 18, TO_TIMESTAMP('2024-12-17 01:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 02:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (74, 66, 13, TO_TIMESTAMP('2024-12-17 02:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 02:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (75, 82, 7, TO_TIMESTAMP('2024-12-17 02:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 03:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (76, 54, 17, TO_TIMESTAMP('2024-12-17 03:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 03:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (77, 34, 6, TO_TIMESTAMP('2024-12-17 03:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 04:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (78, 52, 4, TO_TIMESTAMP('2024-12-17 04:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 04:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (79, 18, 29, TO_TIMESTAMP('2024-12-17 04:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 05:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (80, 67, 12, TO_TIMESTAMP('2024-12-17 05:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 05:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (81, 43, 28, TO_TIMESTAMP('2024-12-17 05:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (82, 60, 35, TO_TIMESTAMP('2024-12-17 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (83, 20, 8, TO_TIMESTAMP('2024-12-17 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (84, 79, 21, TO_TIMESTAMP('2024-12-17 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (85, 15, 23, TO_TIMESTAMP('2024-12-17 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (86, 26, 11, TO_TIMESTAMP('2024-12-17 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (87, 29, 6, TO_TIMESTAMP('2024-12-17 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (88, 42, 1, TO_TIMESTAMP('2024-12-17 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (89, 31, 17, TO_TIMESTAMP('2024-12-17 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

INSERT INTO Deliveries (delivery_id, order_id, delivery_personnel_id, delivery_start_time, delivery_end_time, delivery_status) 
VALUES (90, 21, 34, TO_TIMESTAMP('2024-12-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-12-17 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered');

--customer ratings

INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(1, 45, 10, 4, 'Good food, but delivery was late.', TO_TIMESTAMP('2024-12-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(2, 23, 24, 5, 'Fantastic meal, loved the presentation!', TO_TIMESTAMP('2024-12-02 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(3, 12, 30, 3, 'Food was cold, but still tasty.', TO_TIMESTAMP('2024-12-03 17:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(4, 56, 6, 4, 'Nice flavor, quick delivery!', TO_TIMESTAMP('2024-12-04 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(5, 36, 15, 5, 'Amazing service and food!', TO_TIMESTAMP('2024-12-05 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(6, 19, 22, 3, 'Food arrived late, but decent quality.', TO_TIMESTAMP('2024-12-06 16:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(7, 25, 7, 4, 'Good taste, could improve packaging.', TO_TIMESTAMP('2024-12-07 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(8, 47, 10, 5, 'Really enjoyed the meal, will order again.', TO_TIMESTAMP('2024-12-08 12:15:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(9, 38, 4, 4, 'Great food, the delivery time was acceptable.', TO_TIMESTAMP('2024-12-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(10, 28, 9, 3, 'Food was average, service was good.', TO_TIMESTAMP('2024-12-10 12:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(11, 31, 16, 4, 'Tasty, but a bit too salty.', TO_TIMESTAMP('2024-12-11 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(12, 43, 3, 5, 'Perfect meal, just as expected!', TO_TIMESTAMP('2024-12-12 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(13, 18, 1, 4, 'Delicious but could have been hotter.', TO_TIMESTAMP('2024-12-13 17:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(14, 52, 18, 5, 'Excellent experience, highly recommend!', TO_TIMESTAMP('2024-12-14 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(15, 33, 20, 3, 'The delivery was slow, but food was good.', TO_TIMESTAMP('2024-12-15 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(16, 55, 8, 4, 'Satisfying meal, will order again.', TO_TIMESTAMP('2024-12-16 13:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(17, 29, 5, 5, 'Great quality, timely delivery.', TO_TIMESTAMP('2024-12-17 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(18, 41, 14, 4, 'Very good, but could use more spice.', TO_TIMESTAMP('2024-12-18 15:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(19, 62, 12, 3, 'Average food, late delivery.', TO_TIMESTAMP('2024-12-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(20, 49, 17, 5, 'Loved everything, will order again soon.', TO_TIMESTAMP('2024-12-20 16:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(21, 40, 11, 4, 'Food was tasty, but delivery was delayed.', TO_TIMESTAMP('2024-12-21 12:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(22, 34, 2, 5, 'Perfect! Exactly what I wanted.', TO_TIMESTAMP('2024-12-22 13:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(23, 51, 13, 3, 'Food was good, but late.', TO_TIMESTAMP('2024-12-23 18:15:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(24, 37, 19, 4, 'The food was good, but the delivery was delayed.', TO_TIMESTAMP('2024-12-24 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(25, 58, 8, 5, 'Excellent meal, great service.', TO_TIMESTAMP('2024-12-25 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(26, 39, 4, 3, 'Could have been better, arrived cold.', TO_TIMESTAMP('2024-12-26 13:15:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(27, 50, 7, 4, 'Nice, but needed more flavor.', TO_TIMESTAMP('2024-12-27 15:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(28, 53, 1, 5, 'Great taste and service.', TO_TIMESTAMP('2024-12-28 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(29, 24, 15, 4, 'Good experience, but room for improvement.', TO_TIMESTAMP('2024-12-29 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(30, 22, 6, 5, 'Perfect meal, will repeat.', TO_TIMESTAMP('2024-12-30 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(31, 27, 18, 4, 'Food was good but lacked spice.', TO_TIMESTAMP('2024-12-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(32, 42, 11, 3, 'Food arrived late, but decent quality.', TO_TIMESTAMP('2024-12-02 17:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(33, 56, 19, 4, 'Good overall, but could be spicier.', TO_TIMESTAMP('2024-12-03 13:15:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(34, 23, 20, 5, 'Amazing flavor and fast delivery!', TO_TIMESTAMP('2024-12-04 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(35, 45, 4, 3, 'Food was cold when it arrived.', TO_TIMESTAMP('2024-12-05 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(36, 30, 10, 5, 'Great taste, would recommend to friends!', TO_TIMESTAMP('2024-12-06 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(37, 50, 14, 4, 'Food was good, delivery could be faster.', TO_TIMESTAMP('2024-12-07 16:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(38, 33, 5, 3, 'Food was decent but not hot enough.', TO_TIMESTAMP('2024-12-08 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(39, 25, 12, 4, 'Great meal, but took longer than expected.', TO_TIMESTAMP('2024-12-09 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(40, 44, 3, 5, 'Excellent food, very pleased with the service!', TO_TIMESTAMP('2024-12-10 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(41, 18, 2, 3, 'Food was average, delivery was too slow.', TO_TIMESTAMP('2024-12-11 12:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(42, 38, 16, 4, 'Good meal, but the portions were small.', TO_TIMESTAMP('2024-12-12 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(43, 29, 9, 5, 'Delicious! Would order again for sure.', TO_TIMESTAMP('2024-12-13 18:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(44, 51, 13, 4, 'Good flavor but a bit salty for my taste.', TO_TIMESTAMP('2024-12-14 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(45, 60, 6, 5, 'Wonderful experience, very fresh!', TO_TIMESTAMP('2024-12-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(46, 32, 7, 3, 'Food was fine, but service was slow.', TO_TIMESTAMP('2024-12-16 13:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(47, 27, 8, 5, 'Great food, fast service!', TO_TIMESTAMP('2024-12-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(48, 34, 11, 4, 'Tasty, but too oily for my liking.', TO_TIMESTAMP('2024-12-18 12:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(49, 39, 15, 5, 'Absolutely delicious, will definitely reorder!', TO_TIMESTAMP('2024-12-19 13:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(50, 53, 4, 3, 'Could have been warmer, but flavor was good.', TO_TIMESTAMP('2024-12-20 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(51, 56, 14, 4, 'Good meal, just too much salt.', TO_TIMESTAMP('2024-12-21 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(52, 50, 16, 5, 'Excellent food, would recommend to others.', TO_TIMESTAMP('2024-12-22 12:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(53, 28, 5, 4, 'Food was good, but delivery took too long.', TO_TIMESTAMP('2024-12-23 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(54, 60, 18, 3, 'Food was average, delivery time was acceptable.', TO_TIMESTAMP('2024-12-24 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(55, 36, 9, 4, 'Nice food, but the packaging was poor.', TO_TIMESTAMP('2024-12-25 13:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(56, 40, 8, 5, 'Food was delicious and hot upon arrival.', TO_TIMESTAMP('2024-12-26 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(57, 43, 12, 3, 'Food was okay but delivery was very slow.', TO_TIMESTAMP('2024-12-27 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(58, 45, 6, 4, 'Food was tasty, but could be served hotter.', TO_TIMESTAMP('2024-12-28 12:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(59, 44, 14, 5, 'Great food, fast delivery, will order again!', TO_TIMESTAMP('2024-12-29 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Customer_Ratings (rating_id, customer_id, order_id, rating, comments, rating_date) VALUES
(60, 50, 10, 3, 'It was okay, but not as good as I expected.', TO_TIMESTAMP('2024-12-30 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));


--Get All Orders with Customer, Restaurant, and Payment Details

SELECT o.order_id, o.order_date, c.name AS customer_name, r.name AS restaurant_name, 
       o.total_amount, o.status AS order_status, p.payment_method, p.payment_status
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Restaurants r ON o.restaurant_id = r.restaurant_id
JOIN Payments p ON o.order_id = p.order_id;

--Get Total Sales per Restaurant

SELECT r.name AS restaurant_name, SUM(o.total_amount) AS total_sales
FROM Orders o
JOIN Restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.name;


--Get All Orders and their Items

SELECT o.order_id, o.order_date, fi.food_name, oi.quantity, oi.price, (oi.quantity * oi.price) AS total_price
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN FoodItems fi ON oi.food_id = fi.food_id;


--Get Total Number of Deliveries per Delivery Personnel (Using Subqueries)

SELECT dp.name AS delivery_personnel_name, 
       (SELECT COUNT(d.delivery_id) 
        FROM Deliveries d 
        WHERE d.delivery_personnel_id = dp.delivery_id) AS total_deliveries
FROM Delivery_Personnel dp;

--Get Customer Ratings for Orders (Using Subqueries)

SELECT cr.rating_id, 
       (SELECT c.name FROM Customers c WHERE c.customer_id = cr.customer_id) AS customer_name, 
       cr.order_id, cr.rating, cr.comments, cr.rating_date
FROM Customer_Ratings cr;

--Get All Food Items for a Specific Restaurant

SELECT fi.food_name, fi.price
FROM FoodItems fi
JOIN Restaurants r ON fi.restaurant_id = r.restaurant_id
WHERE r.name = 'Restaurant Name';  -- Replace with the actual restaurant name


--Get Pending Orders

SELECT o.order_id, o.order_date, o.total_amount, o.status
FROM Orders o
WHERE o.status = 'Pending';


--Get Orders Delivered by a Specific Delivery Personnel

SELECT o.order_id, o.order_date, dp.name AS delivery_personnel_name, d.delivery_status
FROM Deliveries d
JOIN Orders o ON d.order_id = o.order_id
JOIN Delivery_Personnel dp ON d.delivery_personnel_id = dp.delivery_id
WHERE dp.name = 'Delivery Person Name';  -- Replace with the actual delivery person name


--Get Restaurants with High Ratings (Average Rating > 4)

SELECT r.name AS restaurant_name, AVG(cr.rating) AS avg_rating
FROM Restaurants r
JOIN Orders o ON r.restaurant_id = o.restaurant_id
JOIN Customer_Ratings cr ON o.order_id = cr.order_id
GROUP BY r.name
HAVING AVG(cr.rating) > 4;

--Get the Top 3 Restaurants with the Highest Total Sales

SELECT r.name AS restaurant_name, 
       SUM(o.total_amount) AS total_sales
FROM Restaurants r
JOIN Orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.name
ORDER BY total_sales DESC
FETCH FIRST 3 ROWS ONLY;

-- Get the Customers Who Have Placed Orders from More Than One Restaurant

SELECT c.customer_id, c.name, COUNT(DISTINCT o.restaurant_id) AS unique_restaurants
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(DISTINCT o.restaurant_id) > 1;

--Get the Most Popular Food Item from Each Restaurant

SELECT r.name AS restaurant_name, 
       fi.food_name, 
       COUNT(oi.order_item_id) AS order_count
FROM Restaurants r
JOIN FoodItems fi ON r.restaurant_id = fi.restaurant_id
JOIN Order_Items oi ON fi.food_id = oi.food_id
GROUP BY r.restaurant_id, r.name, fi.food_name
HAVING COUNT(oi.order_item_id) = 
    (SELECT MAX(order_count) 
     FROM (SELECT COUNT(oi2.order_item_id) AS order_count
           FROM Order_Items oi2 
           JOIN FoodItems fi2 ON oi2.food_id = fi2.food_id
           WHERE fi2.restaurant_id = r.restaurant_id
           GROUP BY oi2.food_id));

