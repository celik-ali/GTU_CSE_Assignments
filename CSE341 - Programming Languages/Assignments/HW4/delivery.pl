%Not used but I defined locations as loc facts.
loc(admin).
loc(cafeteria).
loc(eng_bld).
loc(hall_A).
loc(library).
loc(inst_y).
loc(soc_sci_bld).
loc(inst_x).

%%Since there are conflicts in the map. I defined every possible routes myself. For example if courier wanted to go from eng_bld to library instead of directly going 5t time he can go 4t time by using admin as transfer point. Another ex. is cafeteria...
route(admin, admin, 0).
route(admin, cafeteria, 4).
route(admin, library, 1).
route(admin, eng_bld, 3).
route(admin, soc_sci_bld, 3).
route(admin, hall_A, 5).
route(admin, inst_y, 8).
route(admin, inst_x, 11).

route(cafeteria, cafeteria, 0).
route(cafeteria, admin, 4).
route(cafeteria, library, 4).
route(cafeteria, soc_sci_bld, 2).
route(cafeteria, eng_bld, 7).
route(cafeteria, hall_A, 9).
route(cafeteria, inst_y, 7).
route(cafeteria, inst_x, 10).

route(eng_bld, eng_bld, 0).
route(eng_bld, admin, 3). 
route(eng_bld, hall_A, 2).
route(eng_bld, library, 4).
route(eng_bld, cafeteria, 7). 
route(eng_bld, soc_sci_bld, 6).
route(eng_bld, inst_y, 5).
route(eng_bld, inst_x, 14).

route(hall_A, hall_A, 0).
route(hall_A, admin, 2).
route(hall_A, cafeteria, 9).
route(hall_A, library, 6).
route(hall_A, eng_bld, 2).
route(hall_A, soc_sci_bld, 8).
route(hall_A, inst_y, 3).
route(hall_A, inst_x, 16).

route(library, library, 0).
route(library, soc_sci_bld, 2).
route(library, admin, 1).
route(library, cafeteria, 4).
route(library, eng_bld, 4).
route(library, hall_A, 6).
route(library, inst_y, 3).
route(library, inst_x, 10).

route(soc_sci_bld, soc_sci_bld, 0).
route(soc_sci_bld, admin, 3).
route(soc_sci_bld, cafeteria, 2).
route(soc_sci_bld, eng_bld, 6).
route(soc_sci_bld, hall_A, 8).
route(soc_sci_bld, library, 2).
route(soc_sci_bld, inst_y, 5).
route(soc_sci_bld, inst_x, 8).

route(inst_y, inst_y, 0).
route(inst_y, admin, 8).
route(inst_y, eng_bld, 5).
route(inst_y, cafeteria, 7).
route(inst_y, library, 3).
route(inst_y, hall_A, 3).
route(inst_y, soc_sci_bld, 5).
route(inst_y, inst_x, 13).

route(inst_x, inst_x, 0).
route(inst_x, admin, 11).
route(inst_x, cafeteria, 10).
route(inst_x, eng_bld, 14).
route(inst_x, hall_A, 16).
route(inst_x, library, 10).
route(inst_x, soc_sci_bld, 8).
route(inst_x, inst_y, 13).

%Courier's IDs are c#. If they are carrying a package its ID is written, else empty is written.
courier(c1, 24, 4, p1, library).
courier(c2, 30, 8, empty, cafeteria).
courier(c3, 36, 12, empty, admin).

%Package's IDs are p#. Destination and route points are given. If package is not on route it have none in last part, else it have courier's ID.
package(p1, 15, admin, inst_x, low, none).
package(p2, 5, admin, library, med, none).
package(p3, 24, hall_A, inst_y, low, none).
package(p4, 32, cafeteria, soc_sci_bld, high, none).
package(p5, 10, library, eng_bld, med, c1).

%Rules
% Helper rule to find available delivery personnel for a package in a different location
available_courier(DestinationLoc, CourierID, State, ETA) :-
    courier(CourierID, _, _, State, CurrentLocation),
    route(CurrentLocation, DestinationLoc, ETA).

%To find who is carrying the package according to given PackageId
pack_courier(PackageId, CourierID):-
    package(PackageId, _, _, _, _, CourierID).

who_can_deliver(PackageId):- %Function to see package's situation or see potential delivery guys.
    pack_courier(PackageId, CurCourier),%Package's courier status is returned by pack_courier.
    (CurCourier \= none -> 
        write("Package is already on route courier: "), write(CurCourier); %If package is on route already
        %else
        package(PackageId, PWeigh, PackageLocation, Destination, _, none), %Given package's details are gotten here.
        available_courier(PackageLocation, CourierID, Status, ETA1), %If there is any available courier to come PackageLocation
        (Status \= empty -> %If package is already on route
            write(CourierID), write(" is already in delivery");
            %else finde potential couriers
            courier(CourierID, CourierCap, Whours, empty, _), %Given courier's details are gotten here.
            route(PackageLocation, Destination, ETA2), %ETA is gotten here.
            ETA is ETA1 + ETA2,
            (PWeigh=<CourierCap -> %If weight is proper for courier
                (ETA=<Whours -> %If time is proper for courier
                    write(CourierID), write(" is proper"); 
                    %else  
                    write(CourierID), write(" is not proper because of working hours."));
                %else(If it is heavy)
                write(CourierID), write(" is not proper because of weigh capacity")))).
