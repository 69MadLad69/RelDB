public class Room
{
    public int RoomNumber { get; set; }
    public string Department { get; set; }

    public Room(int number, string department)
    {
        RoomNumber = number;
        Department = department;
    }

    public void PrintInfo()
    {
        Console.WriteLine($"Room {RoomNumber} — {Department}");
    }
}