const pdftopic = require('pdftopic');
const fs = require('fs');

(async () => {
  const pdf = fs.readFileSync('./assets/pdf/file.pdf');

  const converted_result = await pdftopic.pdftobuffer(pdf, "all");

  converted_result.forEach((file, index) => {
      fs.writeFileSync(`./public/slide-${index}.png`, file);
  });
})();
