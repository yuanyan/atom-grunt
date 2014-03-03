// Especially badass external libs.
var findup = require('findup-sync');
var resolve = require('resolve').sync;

// Internal libs.
var path = require('path');

var basedir = atom.project.path || process.cwd();
var gruntpath

// Show help, then exit with a message and error code.
function fatal(msg, code) {
  console.log('Fatal error: ' + msg);
  console.log('');
  [
    'If you\'re seeing this message, either a Gruntfile wasn\'t found or grunt',
    'hasn\'t been installed locally to your project. For more information about',
    'installing and configuring grunt, please see the Getting Started guide:',
    '',
    'http://gruntjs.com/getting-started',
  ].forEach(function(str) { console.log(str); });
};

try {
  gruntpath = resolve('grunt', {basedir: basedir});
} catch (ex) {
  gruntpath = findup('lib/grunt.js');
  // No grunt install found!
  if (!gruntpath) {
    if (options.help) { info.help(); }
    info.fatal('Unable to find local grunt.', 99);
  }
}

// Everything looks good. Require local grunt and run it.
require(gruntpath).cli();
