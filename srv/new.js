const mySrvDemo2 = function (srv) {
  srv.on("myFooBar2", function (req, res) {
    return "Hello World" + req.data.msg;
  });
};
module.exports = mySrvDemo2;
