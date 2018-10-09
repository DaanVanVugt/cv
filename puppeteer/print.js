const puppeteer = require("puppeteer");

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto("file:/home/toon/Documents/Professional/CV/toonweyens.github.io/index.html");
  await page.pdf({
    path: "/home/toon/Documents/Professional/CV/toonweyens.github.io/CV_ToonWeyens.pdf",
    format: "A4",
    printBackground: true,
    displayHeaderFooter: false,
    margin: { top: "1cm", bottom: "1cm", left: "1cm", right: "1cm" }
  });

  await browser.close();
})();
