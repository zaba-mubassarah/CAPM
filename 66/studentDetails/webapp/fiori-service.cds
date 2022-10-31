using mySrvDemo as someNewName from '../../../srv/mysimplesrv';

annotate mySrvDemo.StudentsSRV with @(
  UI: {
    SelectionFields: [ email,first_name],
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
