Class Hospital.HospitalRoom Extends %Persistent
{

Property RoomNumber As %Integer(MAXVAL = 999, MINVAL = 100);

Property RoomId As %Integer [ Required ];

Index RoomIdIndex On RoomId [ Unique ];

Property Department As %String(MAXLEN = 60, MINLEN = 5);

Storage Default
{
<Data name="HospitalRoomDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>RoomNumber</Value>
</Value>
<Value name="3">
<Value>RoomId</Value>
</Value>
<Value name="4">
<Value>Department</Value>
</Value>
</Data>
<DataLocation>^Hospital.HospitalRoomD</DataLocation>
<DefaultData>HospitalRoomDefaultData</DefaultData>
<IdLocation>^Hospital.HospitalRoomD</IdLocation>
<IndexLocation>^Hospital.HospitalRoomI</IndexLocation>
<StreamLocation>^Hospital.HospitalRoomS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
