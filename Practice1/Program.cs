// Rooms
Room r101 = new Room(101, "Surgery");
Room r202 = new Room(202, "Therapy");
Room r303 = new Room(303, "Ambulance Garage");

// Patients
Patient p1 = new Patient("John Doe", 45, "P123", r101, "Appendicitis");

Patient p2 = new Patient("Mary Lee", 30, "P124", r202, "Flu");

Patient[] patientsData = { p1, p2 };

HospitalData hospital = new HospitalData(patientsData);

// Staff
Doctor d1 = new Doctor("Diana Smith", 50, "D001", r101, "Surgeon", null);
Doctor d2 = new Doctor("Brian Worth", 34, "D002", r202, "Therapist", null);

Nurse n1 = new Nurse("Anna Bright", 32, "N010", 5, r101, d1);

AmbulanceDriver a1 = new AmbulanceDriver("Tom Devison", 29, "A001", r303, "L5588");

hospital.AddStaff(d1);
hospital.AddStaff(d2);
hospital.AddStaff(n1);
hospital.AddStaff(a1);

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

hospital.PrintAllData();