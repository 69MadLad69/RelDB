Class Hospital.Person Extends %Persistent [ Abstract ]
{

Property FullName As %String(MAXLEN = 100, MINLEN = 2) [ Required ];

Property Age As %Integer(MAXVAL = 120, MINVAL = 0);

Property IdNumber As %Integer [ Required ];

Index IdNumberIndex On IdNumber [ Unique ];

Property ContactPhones As array Of %String;

Property AssignedRoom As Hospital.HospitalRoom;

Property HomeAddress As Hospital.Address;

Property AgeCategory As %String [ Calculated, SqlComputeCode = { set {AgeCategory} = ##class(Hospital.Patient).CalcAgeCategory({Age}) }, SqlComputed ];

ClassMethod CalcAgeCategory(age As %Integer) As %String
{
    Quit $Select(
        age = "": "",
        age < 18: "Child",
        age < 65: "Adult",
        1: "Senior"
    )
}

Method AgeCategoryGet() As %String [ CodeMode = expression, ServerOnly = 1 ]
{
##class(Hospital.Patient).CalcAgeCategory(..Age)
}

Storage Default
{
<Data name="ContactPhones">
<Attribute>ContactPhones</Attribute>
<Structure>subnode</Structure>
<Subscript>"ContactPhones"</Subscript>
</Data>
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FullName</Value>
</Value>
<Value name="3">
<Value>Age</Value>
</Value>
<Value name="4">
<Value>IdNumber</Value>
</Value>
<Value name="5">
<Value>AssignedRoom</Value>
</Value>
<Value name="6">
<Value>HomeAddress</Value>
</Value>
</Data>
<DataLocation>^Hospital.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^Hospital.PersonD</IdLocation>
<IndexLocation>^Hospital.PersonI</IndexLocation>
<StreamLocation>^Hospital.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
