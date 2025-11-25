// Rooms
Room r101 = new Room(101, "Surgery");
Room r202 = new Room(202, "Therapy");

// Patients
Patient p1 = new Patient("John Doe", 45, "P123", r101, "Appendicitis");

Patient p2 = new Patient("Mary Lee", 30, "P124", r101, "Flu");
p2.AssignedRoom = r202;

Patient[] patientsData = { p1, p2 };

HospitalData hospital = new HospitalData(patientsData);

// Staff
Doctor d1 = new Doctor("Dr. Smith", 50, "D001", r101, "Surgeon", null);
d1.AssignedRoom = r101;

Nurse n1 = new Nurse("Nurse Anna", 32, "N010", 5, r101, d1);
n1.AssignedRoom = r202;

AmbulanceDriver a1 = new AmbulanceDriver("Tom Driver", 29, "A001", r101, "L5588");

hospital.AddStaff(d1);
hospital.AddStaff(n1);
hospital.AddStaff(a1);

d1.Introduce();
d1.Introduce("I am ready for surgery.");
d1.TreatPatient(p1);

p1.Introduce();
p1.Introduce("Please help me, doctor!");

hospital.PrintAllData();