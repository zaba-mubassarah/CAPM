using myCompany.hr.lms from '../db/Students';
using {myCompany.hr.lms1 as lms1} from '../db/Structure';
service mySrvDemo{

    @readonly entity getStudents as projection on lms.Students;
    @updateonly entity updateStudents as projection on lms.Students;
    @insertonly entity InsertStudent as projection on lms.Students;
    @insertonly entity newInsert as projection on lms.Students;
    @deleteonly entity DeleteStudent as projection on lms.Students;

}


service mySrvDemoApp{
   @readonly entity getStudents as projection on lms1.Students;
   @readonly entity getCourses as projection on lms1.Courses;
   @readonly entity getEnrollment as projection on lms1.Enrollments;
   @readonly entity getContents as projection on lms1.Contents;
}
