// Rooms
Room r101 = new Room(1, 101, "Surgery");
Room r202 = new Room(2, 202, "Therapy");
Room r303 = new Room(3, 303, "Ambulance Garage");

// Patients
Patient p1 = new Patient("John Doe", 45, 123, r101, "Appendicitis");

Patient p2 = new Patient("Mary Lee", 30, 124, r202, "Flu");

Patient[] patientsData = { p1, p2 };

// Staff
Doctor d1 = new Doctor("Diana Smith", 50, 1, r101, "Surgeon");
Doctor d2 = new Doctor("Brian Worth", 34, 2, r202, "Therapist");

Nurse n1 = new Nurse("Anna Bright", 32, 10, 5, r101, d1);

AmbulanceDriver a1 = new AmbulanceDriver("Tom Devison", 29, 1, r303, "L5588");

List<Person> Staff = new ();

Staff.Add(d1);
Staff.Add(d2);
Staff.Add(n1);
Staff.Add(a1);

d1.PrintRole();
d1.Introduce("I am ready to proceed with surgery.");
d1.TreatPatient(p1);

p1.PrintRole();
p1.Introduce("Please help me, doctor!");

d2.PrintRole();
d2.Introduce("What bothers you?");
d2.TreatPatient(p2);

p2.PrintRole();
p2.Introduce("O think I caught a flu, my throat hurts.");

Console.WriteLine("\n--- Hospital Staff & Patients ---");

Console.WriteLine("\nStaff:");
foreach (var person in Staff)
{
    person.PrintRole();
}

Console.WriteLine("\nPatients:");
foreach (var p in patientsData)
{
    p.PrintRole();
}