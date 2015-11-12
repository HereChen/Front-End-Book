var jk = require('./jekyllpostparse').jekyllpostparse;

var infile = "2015-11-01-front-end-javascript.md";
var outfile = "some.md";

jk(infile, outfile);