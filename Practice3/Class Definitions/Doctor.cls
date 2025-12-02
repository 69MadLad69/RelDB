Class Hospital.Doctor Extends Hospital.Person
{

Property Specialization As %String(MAXLEN = 50, MINLEN = 3) [ Required ];

Relationship Patients As Hospital.Patient [ Cardinality = many, Inverse = PrimaryDoctor ];

Relationship Nurses As Hospital.Nurse [ Cardinality = many, Inverse = SupervisingDoctor ];

Storage Default
{
<Data name="DoctorDefaultData">
<Subscript>"Doctor"</Subscript>
<Value name="1">
<Value>Specialization</Value>
</Value>
</Data>
<DefaultData>DoctorDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
