## View – Guest Booking Details
CREATE VIEW guest_booking_details AS
SELECT g.GuestID, g.Name, b.BookingID, b.CheckInDate, r.RoomNumber
FROM guests g
JOIN bookings b ON g.GuestID = b.GuestID
JOIN rooms r ON b.RoomID = r.RoomID;

SELECT * FROM guest_booking_details ;
## Updatable View 
UPDATE guest_booking_details SET RoomNumber = '102' WHERE BookingID = 1;

## ComplexView – Total Payments Per Guest
CREATE VIEW total_payments_per_guest AS
SELECT g.GuestID, g.Name,SUM(p.AmountPaid) AS TotalPaid
FROM guests g
JOIN bookings b ON g.GuestID = b.GuestID
JOIN payments p ON b.BookingID = p.BookingID
GROUP BY g.GuestID, g.Name;

select *from total_payments_per_guest;

## View – Services Used with Booking Info
CREATE VIEW booking_services AS
SELECT b.BookingID, g.Name, s.ServiceName, s.ServiceCost
FROM bookings b
JOIN guests g ON b.GuestID = g.GuestID
JOIN services_used s ON b.BookingID = s.BookingID;

SELECT * FROM booking_services WHERE ServiceName = 'Spa';


## Simple View
CREATE VIEW guest_simple AS SELECT GuestID, Name, Email FROM guests;
select *from guest_simple;

## Complex View
CREATE VIEW guest_booking_info AS
SELECT g.Name, b.CheckInDate, r.RoomNumber
FROM guests g
JOIN bookings b ON g.GuestID = b.GuestID
JOIN rooms r ON r.RoomID = b.RoomID;

## Drop View 

drop view guest_booking_info;


