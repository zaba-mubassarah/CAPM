// const cds = require("@sap/cds");
const { Students } = cds.entities("myCompany.hr.lms");

module.exports["mySrvDemo"] = async (srv) => {
  srv.on("READ", "getStudents", async (req, res) => {
    let result;

    const aFilter = req.data;
    if (aFilter !== "undefined") {
      result = await cds.run(SELECT.from(Students).where(aFilter));
    } else {
      result = await cds.run(SELECT.from(Students));
    }
    return result;
  });
  srv.on("CREATE", "updateStudents", async (req, res) => {
    let firstName = req.data.first_name;
    let studentEmail = req.data.email;
    console.log("sdsds", firstName, studentEmail);
    let result = await cds.run(
      UPDATE(Students)
        .set({
          first_name: firstName,
        })
        .where({ email: studentEmail })
    );

    return req.data;
  });
  srv.on("CREATE", "InsertStudent", async (req, res) => {
    let result = await cds.run(
      INSERT.into(Students).entries({
        email: req.data.email,
        first_name: req.data.first_name,
        last_name: req.data.last_name,
        date_sign_up: req.data.date_sign_up,
      })
    );

    return req.data;
  });
  srv.on("CREATE", "DeleteStudent", async (req, res) => {
    let result = await cds.run(
      DELETE.from(Students).where({
        email: req.data.email,
      })
    );

    return req.data;
  });
};
