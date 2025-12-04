Class Hospital.HospitalTests Extends %UnitTest.TestCase
{

Method TestCreatePatientAndAppointment()
{
    set status = ""
    set room   = ""
    set doc    = ""
    set pat    = ""
    set appt   = ""
    set id     = ""

    set room = ##class(Hospital.HospitalRoom).%New()
    set room.RoomId     = 900001
    set room.RoomNumber = 301
    set room.Department = "Test Department"
    set status = room.%Save()
    do $$$AssertStatusOK(status,"Room should be saved successfully")

    set doc = ##class(Hospital.Doctor).%New()
    set doc.IdNumber       = 900001
    set doc.FullName       = "Test Doctor"
    set doc.Age            = 40
    set doc.AssignedRoom   = room
    set doc.Specialization = "Cardiologist"
    set status = doc.%Save()
    do $$$AssertStatusOK(status,"Doctor should be saved successfully")

    set pat = ##class(Hospital.Patient).%New()
    set pat.IdNumber      = 900002
    set pat.FullName      = "Test Patient"
    set pat.Age           = 30
    set pat.AssignedRoom  = room
    set pat.Diagnosis     = "Test Diagnosis"
    set pat.PrimaryDoctor = doc
    set status = pat.%Save()
    do $$$AssertStatusOK(status,"Patient should be saved successfully")

    do $$$AssertEquals(pat.AgeCategory,"Adult", "AgeCategory must be 'Adult' for Age = 30")

    set appt = ##class(Hospital.Appointment).%New()
    set appt.AppointmentId    = 900001
    set appt.AppointmentDate  = $ZDATETIME($HOROLOG,3)
    set appt.Patient           = pat
    set appt.PrescribingDoctor = doc
    do appt.SaveNotes("Unit test appointment notes")

    set status = appt.%Save()
    do $$$AssertStatusOK(status,"Appointment should be saved successfully")

    set id = appt.%Id()
    do ##class(Hospital.Appointment).%DeleteId(id)

    set id = pat.%Id()
    do ##class(Hospital.Patient).%DeleteId(id)

    set id = doc.%Id()
    do ##class(Hospital.Doctor).%DeleteId(id)

    set id = room.%Id()
    do ##class(Hospital.HospitalRoom).%DeleteId(id)
}

Method TestConstraintsAndUnique()
{
    set status = ""
    set room   = ""
    set pat    = ""
    set doc1   = ""
    set doc2   = ""
    set id     = ""

    set pat = ##class(Hospital.Patient).%New()
    set pat.IdNumber = 910001
    set pat.FullName = "No Diagnosis Patient"
    set pat.Age      = 25

    set status = pat.%Save()
    do $$$AssertStatusNotOK(status, "Patient without required Diagnosis must NOT be saved")

    set room = ##class(Hospital.HospitalRoom).%New()
    set room.RoomId     = 910001
    set room.RoomNumber = 50
    set room.Department = "Bad Room"
    set status = room.%Save()
    do $$$AssertStatusNotOK(status, "Room with RoomNumber < 100 must NOT be saved")

    set doc1 = ##class(Hospital.Doctor).%New()
    set doc1.IdNumber       = 910100
    set doc1.FullName       = "Unique Doctor 1"
    set doc1.Age            = 45
    set doc1.Specialization = "TestSpec"
    set status = doc1.%Save()
    do $$$AssertStatusOK(status, "First Doctor with given IdNumber must be saved")

    set doc2 = ##class(Hospital.Doctor).%New()
    set doc2.IdNumber       = doc1.IdNumber 
    set doc2.FullName       = "Unique Doctor 2"
    set doc2.Age            = 46
    set doc2.Specialization = "TestSpec"
    set status = doc2.%Save()
    do $$$AssertStatusNotOK(status, "Second Doctor with duplicate IdNumber must NOT be saved")

    set id = doc1.%Id()
    do ##class(Hospital.Doctor).%DeleteId(id)
}

Method TestParentChildrenDelete()
{
    set status = ""
    set room   = ""
    set doc    = ""
    set pat    = ""
    set appt1  = ""
    set appt2  = ""
    set pid    = ""
    set id1    = ""
    set id2    = ""
    set patO   = ""
    set a1     = ""
    set a2     = ""

    set room = ##class(Hospital.HospitalRoom).%New()
    set room.RoomId     = 920001
    set room.RoomNumber = 401
    set room.Department = "ParentChildDept"
    set status = room.%Save()
    do $$$AssertStatusOK(status,"Room for parent/children test must save")

    set doc = ##class(Hospital.Doctor).%New()
    set doc.IdNumber       = 920001
    set doc.FullName       = "ParentChild Doctor"
    set doc.Age            = 40
    set doc.AssignedRoom   = room
    set doc.Specialization = "TestSpec"
    set status = doc.%Save()
    do $$$AssertStatusOK(status,"Doctor for parent/children test must save")

    set pat = ##class(Hospital.Patient).%New()
    set pat.IdNumber      = 920002
    set pat.FullName      = "ParentChild Patient"
    set pat.Age           = 30
    set pat.AssignedRoom  = room
    set pat.Diagnosis     = "TestDiag"
    set pat.PrimaryDoctor = doc
    set status = pat.%Save()
    do $$$AssertStatusOK(status,"Parent Patient must save")

    set appt1 = ##class(Hospital.Appointment).%New()
    set appt1.AppointmentId    = 920001
    set appt1.AppointmentDate  = $ZDATETIME($HOROLOG,3)
    set appt1.Patient           = pat
    set appt1.PrescribingDoctor = doc
    set status = appt1.%Save()
    do $$$AssertStatusOK(status,"First child appointment must save")
    set id1 = appt1.%Id()

    set appt2 = ##class(Hospital.Appointment).%New()
    set appt2.AppointmentId    = 920002
    set appt2.AppointmentDate  = $ZDATETIME($HOROLOG,3)
    set appt2.Patient           = pat
    set appt2.PrescribingDoctor = doc
    set status = appt2.%Save()
    do $$$AssertStatusOK(status,"Second child appointment must save")
    set id2 = appt2.%Id()

    set pid    = pat.%Id()
    set status = ##class(Hospital.Patient).%DeleteId(pid)
    do $$$AssertStatusOK(status, "Deleting parent Patient with children must succeed and cascade")

    set patO = ##class(Hospital.Patient).%OpenId(pid)
    do $$$AssertTrue(patO="","Parent Patient should no longer exist")

    set a1 = ##class(Hospital.Appointment).%OpenId(id1)
    set a2 = ##class(Hospital.Appointment).%OpenId(id2)
    do $$$AssertTrue(a1="","Child Appointment 1 must be deleted with parent")
    do $$$AssertTrue(a2="","Child Appointment 2 must be deleted with parent")

    do ##class(Hospital.Doctor).%DeleteId(doc.%Id())
    do ##class(Hospital.HospitalRoom).%DeleteId(room.%Id())
}

Method TestSimpleDeleteRoom()
{
    set status = ""
    set room   = ""
    set room2  = ""
    set id     = ""

    set room = ##class(Hospital.HospitalRoom).%New()
    set room.RoomId     = 930001
    set room.RoomNumber = 555
    set room.Department = "DeleteTestDept"
    set status = room.%Save()
    do $$$AssertStatusOK(status,"Test room must be saved before deletion")

    set id    = room.%Id()
    set status = ##class(Hospital.HospitalRoom).%DeleteId(id)
    do $$$AssertStatusOK(status,"Deleting simple Room must succeed")

    set room2 = ##class(Hospital.HospitalRoom).%OpenId(id)
    do $$$AssertTrue(room2="","Room should not exist after deletion")
}

}
