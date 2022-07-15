/**
 * https://fiso.kayosports.com.au/assets/areswidgets/1.17.1/js/areswidgets.min.js
 */
const https = require('https');
const fs = require('fs');
const path = require('path');

const [javascriptUrl, outputDir = __dirname] = process.argv.slice(2); // using __dirname over process.cwd() because this could be called from anywhere

const {groups: {project, version}} = /(?<project>\w+)\/(?<version>\d{1,2}\.\d{1,2}\.\d{1,2})\/[\w\/]+\.min\.js/.exec(javascriptUrl) || {groups: {}};

const sourceMapUrl = new URL(javascriptUrl);
sourceMapUrl.pathname += '.map';

const dirPath = path.join(outputDir, project);
const fileName = `${version}.min.js.map`;
const filePath = path.join(dirPath, fileName);

console.log({
    javascriptUrl,
    sourceMapUrl: sourceMapUrl.href,
    outputDir,
    project,
    version,
    dirPath,
    fileName,
})

https.get(sourceMapUrl, (resp) => {
    let data = '';

    resp.on('data', (chunk) => {
        data += chunk;
    });

    resp.on('end', () => {
        fs.mkdirSync(dirPath, { recursive: true });

        fs.writeFile(filePath, data, function (err) {
            if (err) {
                return console.log(err);
            }

            console.log('Success!');
            console.log(filePath);
        });
    });
}).on('error', (err) => {
    console.log('Error: ' + err.message);
});



