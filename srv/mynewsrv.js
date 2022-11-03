// const cds = require("@sap/cds");
const { Students } = cds.entities("myCompany.hr.lms");

module.exports = (srv) => {
  srv.before("CREATE", "newInsert", async (req, res) => {
    if (
      typeof req.data.email === "undefined" &&
      req.data.email.toLowerCase().indexOf("gmail") === -1
    ) {
      let result = await cds.run(
        INSERT.into(Students).entries({
          email: req.data.email,
          first_name: req.data.first_name,
          last_name: req.data.last_name,
          date_sign_up: req.data.date_sign_up,
        })
      );

      return req.data;
    }
    if (req.data.email.toLowerCase().indexOf("gmail") !== -1) {
      req.error(500, "personal email id not allowed");
    }
  });
};
