public class HospitalData
{
    // List of staff
    public List<Person> Staff { get; set; } = new();

    // Array of patients
    public Patient[] Patients { get; set; }

    public HospitalData(Patient[] patients)
    {
        Patients = patients;
    }

    public void AddStaff(Person p)
    {
        Staff.Add(p);
    }

    public void PrintAllData()
    {
        Console.WriteLine("\n--- Hospital Staff & Patients ---");

        foreach (var person in Staff)
        {
            person.PrintRole();
        }

        Console.WriteLine("\nPatients:");
        foreach (var p in Patients)
        {
            p.PrintRole();
        }
    }
}