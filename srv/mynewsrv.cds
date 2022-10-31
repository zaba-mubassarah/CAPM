using myCompany.hr.lms from '../db/Students';
using  mySrvDemo as mySrvDemo from './mysimplesrv';

extend service mySrvDemo with  @(path:'lms',impl:'./mynewsrv.js'){
     @readonly entity CustomGetStudent as select from lms.Students{
        *,
        first_name || ' ' || last_name as full_name: String
     }
     excluding{
        date_sign_up
     }
     }