# pdf2slideshow
Creates a Reveal.js HTML slideshow from a PDF document

For more info, see [blog post](https://harshp.com/dev/webdev/pdf2slideshow)

## requirements

- `pdftoppm` - extracts PDF pages as images ; usually packed as part of poppler or poppler-utils on your distro
- `pngquant` - compresses PNG ; available in package managers
- `gsed` - text manipulation with files

## How to use

- To convert a single PDF to HTML slideshow, `script.sh -p PDF`

### Parameters:
  - `-p PATH`: Path to PDF or folder
  - `-f`: Force re-processing. Otherwise it will skip folders with `index.html`
  - `-i`: For `script_batch.sh` generates an `index.html` in root folder using `tree`

## PDF -> HTML

1. [`script.sh`](script.sh) does all of the work
2. To edit the final reveal.js template, customise [`template.html`](template.html)
3. You might need to configure location of `reveal.js` in the template, the default is set to work for example in this repo
4. You use it as `script.sh PDF_Path Output_path`
5. It will extract PNG in output folder, copy template as [`index.html`](example/index.html), and insert links to each image in the HTML
6. See demo at [https://harshp.com/pdf2slideshow/example](https://harshp.com/pdf2slideshow/example)

So given a PDF and a PATH, the output will be:
```
PATH
  |-- PDF
  |-- index.html + pngs
```

## License

MIT, see [License file](LICENSE) for full text
