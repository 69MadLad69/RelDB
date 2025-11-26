public class Doctor : Person
{
    public string Specialization { get; set; }
    public List<Patient> CurrentPatients { get; set; }

    public Doctor(string name, int age, int id, Room room, string spec)
        : base(name, age, id, room)
    {
        CurrentPatients = new();
        Specialization = spec;
    }

    public override void PrintRole()
    {
        Console.WriteLine($"{FullName} — Doctor ({Specialization})");
    }

    public void TreatPatient(Patient patient)
    {
        CurrentPatients.Add(patient);
        Console.WriteLine($"{FullName} is treating patient {CurrentPatients.Last().FullName}.\n");
        Console.WriteLine($"Patient {CurrentPatients.Last().FullName} is assigned to room:");
        CurrentPatients.Last().AssignedRoom.PrintInfo();
    }
}