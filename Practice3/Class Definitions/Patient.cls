Class Hospital.Patient Extends Hospital.Person
{

Property Diagnosis As %String(MAXLEN = 120) [ Required ];

Relationship PrimaryDoctor As Hospital.Doctor [ Cardinality = one, Inverse = Patients ];

Property Allergies As list Of %String;

Relationship Appointments As Hospital.Appointment [ Cardinality = children, Inverse = Patient ];

Storage Default
{
<Data name="PatientDefaultData">
<Subscript>"Patient"</Subscript>
<Value name="1">
<Value>Diagnosis</Value>
</Value>
<Value name="2">
<Value>PrimaryDoctor</Value>
</Value>
<Value name="3">
<Value>Allergies</Value>
</Value>
</Data>
<DefaultData>PatientDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
