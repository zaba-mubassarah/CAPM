namespace myCompany.hr.lms;

entity Students{
   key email:String(20);
   first_name:String(20);
   last_name:String(20);
   date_sign_up : Date;
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
                }
      }
  );

