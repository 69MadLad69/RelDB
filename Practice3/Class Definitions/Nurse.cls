Class Hospital.Nurse Extends Hospital.Person
{

Property ExperienceYears As %Integer(MAXVAL = 60, MINVAL = 0);

Relationship SupervisingDoctor As Hospital.Doctor [ Cardinality = one, Inverse = Nurses ];

Storage Default
{
<Data name="NurseDefaultData">
<Subscript>"Nurse"</Subscript>
<Value name="1">
<Value>ExperienceYears</Value>
</Value>
<Value name="2">
<Value>SupervisingDoctor</Value>
</Value>
</Data>
<DefaultData>NurseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
