using myCompany.hr.lms from '../db/Students';
service mySrvDemo{

    @readonly entity getStudents as projection on lms.Students;
    @updateonly entity updateStudents as projection on lms.Students;
    @insertonly entity InsertStudent as projection on lms.Students;
     @insertonly entity newInsert as projection on lms.Students;
    @deleteonly entity DeleteStudent as projection on lms.Students;

}

