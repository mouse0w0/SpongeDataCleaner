var fs = require('fs');

const BUILD_PATH = 'build';
if (!fs.existsSync(BUILD_PATH)) {
    fs.mkdirSync(BUILD_PATH);
}

const CONF_PATH = 'conf';

const WINDOWS_PATH_SEP = '\\';
const UNIX_PATH_SEP = '/';

var windowsWriter = fs.createWriteStream(BUILD_PATH + '/sponge_data_cleaner.bat');

windowsWriter.write(fs.readFileSync('template/windows_header.txt'), 'UTF8');

fs.readdirSync(CONF_PATH).forEach(function (value, index) {
    console.log('Found file: ' + value);
    var conf = JSON.parse(fs.readFileSync(CONF_PATH + '/' + value));
    writeNote(conf['description']);
    conf['directories'].forEach(function (value, index) {
        writeDir(value);
    });
    conf['files'].forEach(function (value, index) {
        writeFile(value);
    });
    writeEndl();
});

windowsWriter.write(fs.readFileSync('template/windows_footer.txt'), 'UTF8');
windowsWriter.end();

function writeNote(note) {
    windowsWriter.write(`rem ${note}\n`);
}

function writeDir(directory) {
    windowsWriter.write(`del /f /s /q ${directory.replace(/\//g, WINDOWS_PATH_SEP)}\n`, 'UTF8');
    windowsWriter.write(`rd /s /q ${directory.replace(/\//g, WINDOWS_PATH_SEP)}\n`, 'UTF8');
}

function writeFile(file) {
    windowsWriter.write(`del /f /s /q ${file.replace(/\//g, WINDOWS_PATH_SEP)}\n`, 'UTF8');
}

function writeEndl() {
    windowsWriter.write('\n', 'UTF8');
}
