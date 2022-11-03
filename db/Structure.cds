namespace myCompany.hr.lms1;

// myCompany.hr.lms1.Contents.csv
// myCompany.hr.lms1.Courses.csv
// myCompany.hr.lms1.Enrollments.csv
// myCompany.hr.lms1.Students.csv

entity Contents{
   key ID:Integer;
   content_url:String(1024);
   date_published:Date;
   content_type:String(20);
   course:Association to Courses;
}


entity Courses{
   key ID:Integer;
   course_name:String(100);
   course_url:String(1024);
   course_duration:DecimalFloat;
   course_price:Decimal(5,2);
   published_status:Boolean;
   content:Association to many Contents on content.course = $self;
   enrollment:Association to many Enrollments on enrollment.course = $self;
}annotate Courses with @(
  UI: {
         
              HeaderInfo: {
                    TypeName: 'course', TypeNamePlural: 'Courses',
                    Title: { Value: course_name },
                    Description: { Value: course_name }
                },  
              
                   FieldGroup#CourseDetails: {
                    Data:[
                    {
                        Value: course_name,
                        Label:'Course name'
                    },
                     {
                        Value: course_duration,
                        Label:'Course duration'
                    },
                    {
                        Value: course_price,
                        Label:'Course price'
                    },
                    {
                        Value: course_url,
                        Label:'Course url'
                    }
                    ]
                    
                },  
      }
  
  );

entity Enrollments{
   key ID:Integer;
   course:Association to Courses;
   student:Association to Students;
}annotate Enrollments with @(
  UI: {
      Facets  : [
                    {
                     $Type:'UI.ReferenceFacet',
                     Label:'Personal Information',
                     Target:'course/@UI.FieldGroup#CourseDetails'
                    } ,
                    

                ],
      LineItem: [
                   {
                        Value: ID,
                        Label:'Id'
                    },
                    {
                        Value: course_ID,
                        Label:'Course'
                    }, 
                ],
               

                
              
                 
      }
  
  );

entity Students{
   key email:String(50);
  first_name:String(40);
  last_name:String(40);
  date_sign_up:Date;
  enrollment:Association to many Enrollments on enrollment.student = $self;
   
}annotate Students with @(
  UI: {
    SelectionFields: [],
      LineItem: [
                    {
                        Value: email,
                        Label:'Email'
                    },
                    {
                        Value: first_name,
                        Label:'First name'
                    },
                    {
                        Value: last_name,
                        Label:'Last name'
                    },
                    {
                        Value: date_sign_up,
                        Label:'Date sign up'
                    }
                ],
                HeaderInfo: {
                    TypeName: 'email', TypeNamePlural: 'Emails',
                    Title: { Value: email },
                    Description: { Value: first_name }
                },
                Facets  : [
                    {
                     $Type:'UI.ReferenceFacet',
                     Label:'Personal Information',
                     Target:'@UI.FieldGroup#PersonalStudentInfo'
                    } ,
                    {
                     $Type:'UI.ReferenceFacet',
                     Label:'Enrollment Details',
                     Target:'enrollment/@UI.LineItem'
                    } ,

                ],
                FieldGroup#PersonalStudentInfo: {
                    Data:[
                    {
                        Value: email,
                        Label:'Email'
                    },
                     {
                        Value: first_name,
                        Label:'First name'
                    },
                    {
                        Value: last_name,
                        Label:'Last name'
                    },
                    {
                        Value: date_sign_up,
                        Label:'Date sign up'
                    }
                    ]
                    
                },
                 
      }
  
  );