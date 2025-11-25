public class AmbulanceDriver : Person
{
    public string LicenseNumber { get; set; }

    public AmbulanceDriver(string name, int age, string id, Room room, string license)
        : base(name, age, id, room)
    {
        LicenseNumber = license;
    }

    public override void PrintRole()
    {
        Console.WriteLine($"{FullName} — Ambulance Driver (License {LicenseNumber})");
    }
}