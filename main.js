// main.js - adds interactivity and improves user experience
document.addEventListener("DOMContentLoaded", function () {
  // Set current year for copyright text
  const yearEl = document.getElementById("current-year");
  if (yearEl) {
    yearEl.textContent = new Date().getFullYear();
  }

  // Add page load time for performance monitoring
  const loadTime =
    window.performance.timing.domContentLoadedEventEnd -
    window.performance.timing.navigationStart;
  console.log("Page load time:", loadTime, "ms");

  // Track outbound links for analytics
  document
    .querySelectorAll('a[href^="http"], a[href^="https://api.whatsapp.com"]')
    .forEach((link) => {
      link.addEventListener("click", function (e) {
        const url = this.getAttribute("href");
        if (window.clarity) {
          window.clarity("set", "outbound_click", url);
        }
      });
    });
});
