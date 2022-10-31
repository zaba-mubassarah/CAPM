using myCompany.hr.lms from '../db/Students';
service mySrvDemo2 {

    @readonly entity newSrv as projection on lms.Students;

    function myFooBar2(msg:String) returns String;

}