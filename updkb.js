#!/usr/bin/env node

// updkb.js
// job    : updates the updated timestamp on kb articles
// git    : https://github.com/motetpaper/bbqkit
// lic    : MIT
//
//


const fs = require('fs')

const infile = process.argv[2];
const outfile = infile;

fs.readFile(infile, 'utf8', (err,data)=>{
  const dt = new Date();

  const tz = 'UTC';
  const upd = [
    'updated:',
    dt.toLocaleDateString('en-CA', { timeZone: tz }),
    dt.toLocaleTimeString('en-GB', { timeZone: tz }),
  ].join(' ');

  // updates the `updated:` field in Jekyll front matter
  const re = /updated: .*/;
  const outdata = '' + data.replace(re, upd);
  console.log(`[updkb.js] ${upd} -> ${outfile}`);

  fs.writeFile(outfile, outdata, (err)=>{
    if (err) throw err;
    console.log(`[updkb.js] Saved ${outfile}`)
  });
});
