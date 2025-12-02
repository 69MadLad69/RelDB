Class Hospital.Appointment Extends %Persistent
{

Property AppointmentId As %Integer [ Required ];

Index AppointmentIdIndex On AppointmentId [ Unique ];

Property AppointmentDate As %DateTime [ Required ];

Relationship Patient As Hospital.Patient [ Cardinality = parent, Inverse = Appointments ];

Property PrescribingDoctor As Hospital.Doctor;

Property Prescription As %Stream.GlobalCharacter;

Method SaveNotes(text As %String) As %Status
{
    If ..Prescription = "" {
        Set ..Prescription = ##class(%Stream.GlobalCharacter).%New()
    }
    Do ..Prescription.WriteLine(text)
    Quit 1
}

Method ReadNotes() As %String
{
    If ..Prescription = "" {
        Quit ""
    }
    Do ..Prescription.Rewind()
    Quit ..Prescription.Read()
}

Storage Default
{
<Data name="AppointmentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AppointmentId</Value>
</Value>
<Value name="3">
<Value>AppointmentDate</Value>
</Value>
<Value name="4">
<Value>PrescribingDoctor</Value>
</Value>
<Value name="5">
<Value>Prescription</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Hospital.Patient.Appointments")</DataLocation>
<DefaultData>AppointmentDefaultData</DefaultData>
<IdLocation>^Hospital.PatientC("Appointments")</IdLocation>
<IndexLocation>^Hospital.AppointmentI</IndexLocation>
<StreamLocation>^Hospital.AppointmentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
