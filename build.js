const nexe = require('nexe');

nexe.compile({
  input: 'server.js', // Your main server script
  output: 'numpadios-server',    // Name of the output executable
}, function(err) {
  if (err) {
    console.error(err);
    return;
  }
  console.log('Executable created!');
});

