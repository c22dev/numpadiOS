const express = require('express');
const robot = require('robotjs');
const qrcode = require('qrcode');
const os = require('os');

const app = express();
const port = 3000;
const networkInterfaces = os.networkInterfaces();
const ipv4Interfaces = networkInterfaces['en0'] || networkInterfaces['eth0'] || networkInterfaces['wlan0'] || [];


const interfaces = os.networkInterfaces();
const addresses = [];
for (const k in interfaces) {
    for (const k2 in interfaces[k]) {
        const address = interfaces[k][k2];
        if (address.family === 'IPv4' && !address.internal) {
            addresses.push(address.address);
        }
    }
}

const localIPv4Address = addresses[0]; // I SET THE FUCKING VARIABLE UP HERE !!!!!!!!

app.use(express.json());

app.post('/touch', (req, res) => {
    const intValue = req.body.intValue;
    if (os.platform() === 'linux') {
        if (intValue >= 0 && intValue <= 9) {
            robot.keyTap(intValue);
        } else if (intValue === 11) {
            robot.keyTap('.');
        } else {
            console.log('Invalid input value');
        }
    } else {
        if (intValue >= 0 && intValue <= 9) {
            robot.keyTap('numpad_' + intValue);
        } else if (intValue === 11) {
            robot.keyTap('.');
        } else {
            console.log('Invalid input value');
        }
    }

    res.sendStatus(200);
});

app.listen(port, () => {
    console.log(`IP for manual input : ${localIPv4Address}`);
    qrcode.toString(localIPv4Address, { type: 'terminal' }, (err, qrCode) => {
            if (err) {
                console.error('Error generating QR code:', err);
            } else {
                console.log(qrCode);
            }
        });
});

