# NS-Website
[Template website for a national school.](https://byrne-greg.github.io/NS-Website/index.html)

## What is this?
It is a collection of webpages whose content is generated using [XSL transformations](https://www.w3schools.com/xml/xsl_intro.asp]) around a data layer consisting of XML files. The webpages are based around the theme and basic requirements for a national school. 

The content and structure (i.e. HTML) are defined within the stylesheet and use the data contained with the XML. These are generated at build time. The other static artefacts consist of CSS for styling, Javascript (JQuery) for the behaviour, and images. Responsive web design is used to ensure displays between mobile and desktop screens.

After generating the HTML, they are source controlled and hosted using [Github Pages](https://pages.github.com/).

### Technologies Used
* HTML
* CSS
* Javascript (JQuery)
* XSLT 1.0
* XML
* [Apache ANT](https://ant.apache.org/)

## Requirements
1. Apache ANT (to generate the HTML from XSL transformation using the [XSLT task](https://ant.apache.org/manual/Tasks/style.html)).
  * *Note*: Apache ANT comes bundled with Xalan required for XSL transformations.

## How to generate
1. Run the `build.sh` file. This will call the build script that generates the HTML artefacts within the `../docs` folder.

## Understanding file structure
* `../bin` contains binaries and build files.
* `../data` contains data files used during transformation.
* `../docs` contains web artefacts (e.g. HTML, CSS, JS, media, etc.).
* `../styles` contains the XSL transformation stylesheets.
