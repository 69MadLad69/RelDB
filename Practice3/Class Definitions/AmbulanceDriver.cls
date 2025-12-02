Class Hospital.AmbulanceDriver Extends Hospital.Person
{

Property LicenseNumber As %String(MAXLEN = 20, MINLEN = 5) [ Required ];

Index LicenseNumberIndex On LicenseNumber [ Unique ];

Storage Default
{
<Data name="AmbulanceDriverDefaultData">
<Subscript>"AmbulanceDriver"</Subscript>
<Value name="1">
<Value>LicenseNumber</Value>
</Value>
</Data>
<DefaultData>AmbulanceDriverDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
