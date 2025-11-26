public class Room
{
    private int _idNumber;
    public int IdNumber => _idNumber;
    public int RoomNumber { get; set; }
    public string Department { get; set; }

    public Room(int id, int number, string department)
    {
        _idNumber = id;
        RoomNumber = number;
        Department = department;
    }

    public void PrintInfo()
    {
        Console.WriteLine($"Room {RoomNumber} — {Department}\n");
    }
}