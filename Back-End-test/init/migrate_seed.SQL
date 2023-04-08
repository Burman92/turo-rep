CREATE TABLE IF NOT EXISTS hosts(
    id serial NOT NULL, 
    host_name varchar(30), 
    host_profile_pic varchar(400),
    host_rating int, 
    host_badge varchar(200),
    host_trips int, 
    host_joined_date date,
    host_response_time int,
    host_badge_icon varchar(200),
    host_training_icon varchar(200),
    host_training_description varchar(400),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS cars(
    id serial NOT NULL, 
    car_make varchar(50), 
    car_model varchar(50),
    car_year int, 
    car_name varchar(50),
    car_description varchar(5000),
    car_max_distance int, 
    car_additional_miles_fee int, 
    car_parking_details varchar(100), 
    car_guidelines varchar(100),
    car_tolls_fastrak varchar(500),
    car_tickets varchar(500),
    host_id int, 
    FOREIGN KEY (host_id) REFERENCES hosts(id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS features(
    id serial NOT NULL, 
    feature_description varchar(30), 
    feature_icon varchar(200),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS car_features(
    id serial NOT NULL, 
    feature_id int, 
    car_id int,
    PRIMARY KEY (id),
    FOREIGN KEY (car_id) REFERENCES cars(id),
    FOREIGN KEY (feature_id) REFERENCES features(id)
);

CREATE TABLE IF NOT EXISTS photos(
    id serial NOT NULL, 
    photo_locations varchar(300), 
    car_id int, 
    FOREIGN KEY (car_id) REFERENCES cars(id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS faq(
    id serial NOT NULL, 
    faq_question varchar(300), 
    faq_answer varchar(300), 
    car_id int, 
    FOREIGN KEY (car_id) REFERENCES cars(id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users(
    id serial NOT NULL, 
    user_name varchar(30),
    user_password varchar(20), 
    user_email varchar(100),
    user_age int, 
    user_profile_pic varchar(200),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS reviews(
    id serial NOT NULL, 
    review_rating int, 
    review_message varchar(300)
    review_date date, 
    review_host_response varchar(200),
    car_id int, 
    user_id int,
    FOREIGN KEY (car_id) REFERENCES cars(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS reports(
    id serial NOT NULL, 
    report_categories varchar(30),
    report_description varchar(300),
    car_id int, 
    user_id int,
    FOREIGN KEY (car_id) REFERENCES cars(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS reservations(
    id serial NOT NULL, 
    reservation_start_date date, 
    reservation_end_date date, 
    reservation_start_time time, 
    reservattion_end_time time, 
    reservation_pick_up_location varchar(100),
    reservation_drop_off_location varchar(100), 
    reservation_cost_per_day int, 
    reservation_protection_plan_fee int, 
    reservation_trip_fee int, 
    reservation_young_driver_fee boolean, 
    reservation_total_cost int, 
    reservation_extras_cost int,
    car_id int, 
    user_id int,
    FOREIGN KEY (car_id) REFERENCES cars(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS extras(
    id serial NOT NULL, 
    extra_number_available int, 
    extra_cost int, 
    extra_description varchar(100),
    extra_name varchar(100),
    car_id int, 
    FOREIGN KEY (car_id) REFERENCES cars(id),
    PRIMARY KEY (id)
);

--------------- Host Seeding -------------
INSERT INTO hosts( 
    host_name, 
    host_profile_pic,
    host_rating, 
    host_badge,
    host_trips, 
    host_joined_date,
    host_response_time,
    host_badge_icon,
    host_training_icon,
    host_training_description
)
   VALUES ('Carima', 'NoPic', 5, 'All-Star Host', 159, '2020-04-01', 35, 'NoPic', 'NoPic','Carima has completed training on enhanced cleaning and disinfection practices.');

--------------- User Seeding --------------
INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Sam', 'password' , 'sam.fake@gmail.com', 23, 'turo\Front-End\turo\src\media\profileIcons\SamIcon.PNG');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Christina', 'password', 'christina.fake@gmail.com', 25, 'No file'); 

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Nelson', 'password' , 'nelson.fake@gmail.com', 28, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Calvin', 'password' , 'calvin.fake@gmail.com', 30, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Salma', 'password' , 'salma.fake@gmail.com', 22, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Carlotta', 'password' , 'carlotta.fake@gmail.com', 25, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Trevor', 'password' , 'trevor.fake@gmail.com', 27, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Marcella', 'password' , 'marcella.fake@gmail.com', 25, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Fionnuala', 'password' , 'fionnuala.fake@gmail.com', 25, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Anna', 'password' , 'anna.fake@gmail.com', 25, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Sarah', 'password' , 'sarah.fake@gmail.com', 25, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Henry', 'password' , 'henry.fake@gmail.com', 25, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Trevor', 'password' , 'trevor.fake@gmail.com', 25, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Michelle', 'password' , 'michelle.fake@gmail.com', 25, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Turo', 'password' , 'turo.fake@gmail.com', 00, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Steven', 'password' , 'steven.fake@gmail.com', 30, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Torian', 'password' , 'torian.fake@gmail.com', 28, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Jason', 'password' , 'jason.fake@gmail.com', 35, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Isamel', 'password' , 'isamel.fake@gmail.com', 20, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Samantha', 'password' , 'samantha.fake@gmail.com', 40, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Marta', 'password' , 'marta.fake@gmail.com', 38, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Gregg', 'password' , 'turo.fake@gmail.com', 24, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Andrea', 'password' , 'andrea.fake@gmail.com', 30, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Phillip', 'password' , 'phillip.fake@gmail.com', 32, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Justin', 'password' , 'turo.fake@gmail.com', 40, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Kitty', 'password' , 'kitty.fake@gmail.com', 30, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Shaween', 'password' , 'shaween.fake@gmail.com', 22, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Kacie', 'password' , 'kacie.fake@gmail.com', 35, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Alizabeth', 'password' , 'alizabeth.fake@gmail.com', 30, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Bryan', 'password' , 'bryan.fake@gmail.com', 40, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Grant', 'password' , 'grant.fake@gmail.com', 32, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Ramon', 'password' , 'ramon.fake@gmail.com', 33, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Joseph', 'password' , 'joseph.fake@gmail.com', 32, 'No file');

INSERT INTO users(user_name, user_password, user_email, user_age, user_profile_pic)
   VALUES ('Ramesh', 'password' , 'ramesh.fake@gmail.com', 31, 'No file');
   

--------------- Review Seeding --------------
INSERT INTO reviews(review_rating, review_date, review_message, review_host_response, car_id, user_id)
   VALUES (5, 'Mar 21, 2023' , 'Thank you and it was great to meet you', 'It was a joy to Host you', 1, 1);

INSERT INTO reviews(review_rating, review_date, review_message, review_host_response, car_id, user_id)
   VALUES (5, 'Apr 4, 2023' , 'This was our first time using Turo but definitely won’t be our last! I just hope every experience is as great as this one. Carima greeted us at the airport terminal when we arrived and met us at the terminal when we were flying out. It absolutely could not have been any easier. The Jeep was in perfect condition and a lot of fun! 5 stars is not enough for this experience!',
    '', 2, 1);


-------------- Car Listing Seeding -------------
INSERT INTO cars(
    car_make, 
    car_model,
    car_year, 
    car_name,
    car_description,
    car_max_distance, 
    car_additional_miles_fee, 
    car_parking_details, 
    car_guidelines,
    car_tolls_fastrak,
    car_tickets,
    host_id)
   VALUES ('Jeep', 
   'Wrangler', 
   2015, 
   'Unlimited Sahara',
   '⏰ 24/7 Delivery and pick up 
        🛩 Airport•Hotel•Residence Delivery
        ⛽️ Delivered on Full
        🧼 Cleaned, Deodorized, & Disinfected 

        ⭐️⭐️⭐️⭐️⭐️ Power Host ⭐️⭐️⭐️⭐️⭐️

        We would love the opportunity to be your Turo Host. 24/7 drop off and pick up airport or home locations  

        We accommodate short and long term rentals, and work seamlessly with agencies to support staff with transportation. 

        Vehicles are cleaned, washed, and disinfected before and after each use. Delivered with a full tank of ⛽️ gas.

        Look no further, this automatic with V6 engine is the ultimate head turner. Perfect for cruising around town or long distance trips, appropriate for winter and summer. Sexy profile, Optional transformer with removable top. Spacious, leather seating, Stylish 18-inch All-Terrain tires. Automatic windows, Ac, heated seats, GPS, and sound system, Appropriate for all events skiing, camping, hiking, cruising the coast, or wine tasting in Napa, just a few examples provided for you, chains available as extra per your request.


        The greatest gift we could give is flexibility, when traveling many situations can arise, we implement Understanding, empathy, patience, and anticipation of changes. Our goal is to provide a seamless experience, where you can focus on creating memories.

        Please note: this car is equipped with a security device that collects driving data. This includes vehicle location, mileage, driving behaviour, and time driven. This information may be shared with third parties for vehicle recovery or insurance purposes.',
    300, 
    .26, 
    'Vehicle will be delivered in-person to curbside of your selected flight for arrivals and departures. In the event we can’t deliver curbside, self check-in will be utilized, vehicle will be parked in airport parking nearest your terminal. Further details will be provided closer to your reservation date.',
    'No pets 🐕
        No off roading 🏔
        Violation fee will be added to your statement',
    'Tolls & Fastrak

        Due to COVID-19 Bridge tolls, are not accepting Cash, Our vehicles are registered with Fastrak, payment is withdrawn from our accounts and you will be billed for tolls during your reservation. Invoices will be populated through Turo, and payment requests.

        Antioch Bridge	$6.00
        Bay Bridge	$5 weekday off peak and $6 weekend
        Benicia – Martinez Bridge	$6.00
        Carquinez Bridge	$6.00
        Dumbarton Bridge	$6.00
        Golden Gate Bridge.                  $8.70 
        Richmond – San Rafael Bridge	$6.00',
        'If you get a ticket, notify your host as soon as possible. Every transportation authority has a different billing cycle, which means your host may not receive the ticket and send you an invoice until several months after your trip ends. That means your host may not receive notice of a ticket until long after your trip has ended. 

        If a host sends you an invoice, we’ll notify you via email and display a notification in your Turo activity feed. You have 48 hours to pay or dispute the invoice. Click on the link in the email or notification or open Trip details for the trip in question to view the invoice. Then tap “Accept and pay” or “Dispute.”  If you’ve booked a trip with a Commercial Host, they’re unable to invoice you for incidental costs via Turo and will contact you directly to resolve any reimbursement issues.',
        1);

----------------- Features Seeding -----------------

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Must be 21+ to book', 'turo\Front-End\turo\src\media\featureIcons\21+.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('All-wheel drive', 'turo\Front-End\turo\src\media\featureIcons\allWheel.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Apple Car Play', 'turo\Front-End\turo\src\media\featureIcons\appleCarPlay.PNG', 1);
   
INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Automic transmission', 'turo\Front-End\turo\src\media\featureIcons\automatic.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('AUX Input', 'turo\Front-End\turo\src\media\featureIcons\auxInput.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Bluetooth', 'turo\Front-End\turo\src\media\featureIcons\bluetooth.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Convertible', 'turo\Front-End\turo\src\media\featureIcons\convertible.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Heated Seats', 'turo\Front-End\turo\src\media\featureIcons\heatedseats.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Long-Term-Car', 'turo\Front-End\turo\src\media\featureIcons\longTerm.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Sunroof', 'turo\Front-End\turo\src\media\featureIcons\sunroof.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('USB Charger', 'turo\Front-End\turo\src\media\featureIcons\usbCharger.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Leather Seats', 'turo\Front-End\turo\src\media\featureIcons\generic.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Backup Camera', 'turo\Front-End\turo\src\media\featureIcons\allWheel.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Child Seat', 'turo\Front-End\turo\src\media\featureIcons\allWheel.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('GPS', 'turo\Front-End\turo\src\media\featureIcons\allWheel.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Keyless Entry', 'turo\Front-End\turo\src\media\featureIcons\allWheel.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Snow tires or chains', 'turo\Front-End\turo\src\media\featureIcons\allWheel.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Toll Pass', 'turo\Front-End\turo\src\media\featureIcons\allWheel.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('USB Input', 'turo\Front-End\turo\src\media\featureIcons\allWheel.PNG', 1);

INSERT INTO features( feature_description, feature_icon, car_id)
   VALUES ('Fastrak', 'turo\Front-End\turo\src\media\featureIcons\allWheel.PNG', 1);

----------------- Features Seeding -----------------

INSERT INTO extras(extra_number_available, extra_cost, extra_description, extra_name, car_id)
   VALUES (0, 50, 'Driver and passenger roof panels.', 'Camper shell', 1);

INSERT INTO extras(extra_number_available, extra_cost, extra_description, extra_name, car_id)
   VALUES (0, 125, 'Removal of roof, only for trips 2 days or less.', 'Camper shell', 1);

INSERT INTO extras(extra_number_available, extra_cost, extra_description, extra_name, car_id)
   VALUES (1, 50, 'WiFi Connectivity  • In-car productivity & entertainment with Wi-Fi hotspot for up to 5 devices', 'Portable WiFi hotspot', 1);

INSERT INTO extras(extra_number_available, extra_cost, extra_description, extra_name, car_id)
   VALUES (1, 50, 'Car seat available, please provide age of child.', 'Child Safety Seat', 1);

INSERT INTO extras(extra_number_available, extra_cost, extra_description, extra_name, car_id)
   VALUES (0, 100, 'Save time, make drop-off a breeze, and avoid additional fees by adding this Extra, which allows you to return my car at any fuel level. Price includes up to a full tank of gas.', 'Prepaid refuel', 1);

INSERT INTO extras(extra_number_available, extra_cost, extra_description, extra_name, car_id)
   VALUES (1, 10, 'Cooler, per your request ', 'Cooler', 1);

