const project = '../CAPM' // The project's root folder
const cds = require('@sap/cds/lib')
cds.test(project)

const { GET, expect } = cds.test(project)
describe('my test suite',  ()=>{

 
  it('Create an entity', async () => {
    const db = await cds.connect.to('db')  
    const {Students} = db.model.entities('myCompany.hr.lms') 
    await db.create(Students).entries([ 
      {email: "shanita@test.com", first_name: "demo", last_name: "demo", date_sign_up: "2019-10-10" }, 
    ])
    const { data } = await GET `/my-srv-demo2/newSrv`
    expect(data.value).to.containSubset([{email:"shanita@test.com", first_name: "demo", last_name: "demo", date_sign_up: "2019-10-10" }])
  })

  it('Get an entity', async () => {
    const { data } = await GET `/my-srv-demo2/newSrv`
    expect(data.value).to.containSubset([{email:"shanita@test.com", first_name: "demo", last_name: "demo", date_sign_up: "2019-10-10" }])
  })

  it('Search an entity', async () => {
    const { data } = await GET `/my-srv-demo2/newSrv?$filter=email eq 'shanita@test.com'`
    expect(data.value).to.containSubset([{email:"shanita@test.com", first_name: "demo", last_name: "demo", date_sign_up: "2019-10-10" }])
  })
  it('get entity by pagination ', async () => {
    const { data } = await GET `/my-srv-demo2/newSrv?$top=2`
    expect(data.value).to.eql([{email:"anin@demo.com", first_name: "john", last_name: "din", date_sign_up: "2019-10-10" },{email:"demo@demo.com", first_name: "demo", last_name: "demo", date_sign_up: "2019-10-10" }])
  })

  it('pagination with containing the enitity', async () => {
    const { data } = await GET `/my-srv-demo2/newSrv?$top=2`
    expect(data.value).to.containSubset([{email:"anin@demo.com", first_name: "john", last_name: "din", date_sign_up: "2019-10-10" }])
  })
  it('Update an entity', async () => {
    const db = await cds.connect.to('db');
    const { Students } = db.model.entities('myCompany.hr.lms');
    
    // Update the entity
    await db.update(Students).set({ first_name: 'updated_demo' }).where({ email: 'shanita@test.com' });
  
    // Verify the entity is updated
    const { data } = await GET `/my-srv-demo2/newSrv`;
    expect(data.value).to.containSubset([{ email: 'shanita@test.com', first_name: 'updated_demo' }]);
  });
  it('Delete an entity', async () => {
    const db = await cds.connect.to('db');
    const { Students } = db.model.entities('myCompany.hr.lms');
    
    // Delete the entity
    await db.delete(Students).where({ email: 'shanita@test.com' });
  
    // Verify the entity is deleted
    const { data } = await GET `/my-srv-demo2/newSrv`;
    expect(data.value).to.not.containSubset([{ email: 'shanita@test.com' }]);
  });
})