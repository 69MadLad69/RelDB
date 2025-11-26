public class Nurse : Person
{
    public int ExperienceYears { get; set; }
    public Doctor AssistedDoctor { get; set; }

    public Nurse(string name, int age, int id, int exp, Room room, Doctor doctor)
        : base(name, age, id, room)
    {
        AssistedDoctor = doctor;
        ExperienceYears = exp;
    }

    public override void PrintRole()
    {
        Console.WriteLine($"{FullName} — Nurse ({ExperienceYears} years experience) assisting doctor {AssistedDoctor.FullName}");
    }
}