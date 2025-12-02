Class Hospital.Address Extends %SerialObject
{

Property Street As %String(MAXLEN = 100);

Property City As %String(MAXLEN = 80);

Property ZipCode As %String(MAXLEN = 10);

Property Country As %String(MAXLEN = 80);

Storage Default
{
<Data name="AddressState">
<Value name="1">
<Value>Street</Value>
</Value>
<Value name="2">
<Value>City</Value>
</Value>
<Value name="3">
<Value>ZipCode</Value>
</Value>
<Value name="4">
<Value>Country</Value>
</Value>
</Data>
<State>AddressState</State>
<StreamLocation>^Hospital.AddressS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
