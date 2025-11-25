public class Patient : Person
{
    public string Diagnosis { get; set; }

    public Patient(string name, int age, string id, Room room, string diagnosis)
        : base(name, age, id, room)
    {
        Diagnosis = diagnosis;
    }

    public override void PrintRole()
    {
        Console.WriteLine($"{FullName} is a patient diagnosed with '{Diagnosis}'.");
    }
}
