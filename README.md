# pdf2slideshow

Creates a Reveal.js HTML slideshow from a PDF document.

Adapted for Medic Home purposes.

For more info, see [blog post](https://harshp.com/dev/webdev/pdf2slideshow)

## Requirements

- `pdftoppm` - extracts PDF pages as images ; usually packed as part of poppler or poppler-utils on your distro
- `gsed` - text manipulation with files

## How to use

- To convert a single PDF to HTML slideshow, `./script.sh`

## PDF -> HTML

- To edit the final reveal.js template, customise [`template.html`](template.html)
- You use it as `./script.sh`
- It will extract PNG in output folder, copy template as [`index.html`](public/index.html), and insert links to each image in the HTML
- See demo at [https://harshp.com/pdf2slideshow/example](https://harshp.com/pdf2slideshow/example)

So given a PDF and a PATH, the output will be:
```
assets
  |-- pdf/PDF
  |-- revealjs
  |-- template.html
public
  |-- index.html + pngs
```

## License

MIT, see [License file](LICENSE) for full text
