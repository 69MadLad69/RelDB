public class Doctor : Person
{
    public string Specialization { get; set; }
    public Patient? CurrentPatient { get; set; }

    public Doctor(string name, int age, string id, Room room, string spec,  Patient? patient)
        : base(name, age, id, room)
    {
        CurrentPatient = patient;
        Specialization = spec;
    }

    public override void PrintRole()
    {
        Console.WriteLine($"{FullName} — Doctor ({Specialization})");
    }

    public void TreatPatient(Patient patient)
    {
        CurrentPatient = patient;
        Console.WriteLine($"{FullName} is treating patient {CurrentPatient.FullName}.");
    }
}