const { exec } = require('child_process');
const fs = require("fs-extra");
const path = require("path");


const gitConfigFile = ".gitconfig"
exec(` FILE=${gitConfigFile} &&  if test -f "$FILE"; then echo "$FILE exists."; fi`, (error, stdout, stderr) => {
  if (error) {
    console.log(error.stack);
    console.log('Error code: ', error.code);
    console.log('Signal received: ', error.signal);
  }
  
  if (!stdout) {
    console.log(`${gitConfigFile} file doesn't exist`)
    console.log(`--- read the template`)

    // read the template
    let gitConfigTemplate = fs.readFileSync(
      `${__dirname}/templates/gitconfig.template`,
      "utf8"
    ); 
    gitConfigTemplate = gitConfigTemplate
    .replace(/{{user}}/gm, process.argv[2])
    .replace(/{{email}}/gm, process.argv[3]);
  
    console.log(`--- write the template`)
    fs.writeFileSync(
      `${gitConfigFile}`,
      gitConfigTemplate,
      function (err) {
        if (err) return console.log(err);
      }
    );
    console.log(`${gitConfigFile} created`);
  } else {
    console.log(`${gitConfigFile} file exist `)
  }
});

exec(`sh initpost.sh`, (error, stdout, stderr) => {
  if (error) {
    console.log(error.stack);
    console.log('Error code: ', error.code);
    console.log('Signal received: ', error.signal);
  }
  
  console.log(stdout)
});


exec('ls -lah', (error, stdout, stderr) => {
  if (error) {
    console.log(error.stack);
    console.log('Error code: ', error.code);
    console.log('Signal received: ', error.signal);
  }
  
  console.log("il existe",stdout)
});