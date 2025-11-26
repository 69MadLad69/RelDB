public abstract class Person
{
    // Public properties (simple data types)
    public string FullName { get; set; }
    public int Age { get; set; }

    // Private field + public getter
    private int _idNumber;
    public int IdNumber => _idNumber;

    // Reference to another object
    public Room AssignedRoom { get; set; }

    public Person(string fullName, int age, int idNumber, Room room)
    {
        FullName = fullName;
        Age = age;
        _idNumber = idNumber;
        AssignedRoom = room;
    }

    // Abstract method
    public abstract void PrintRole();

    // Overloaded methods
    public void Introduce()
    {
        Console.WriteLine($"Hello, I'm {FullName}.\n");
    }

    public void Introduce(string message)
    {
        Console.WriteLine($"Hello, I'm {FullName}. {message} \n");
    }
}