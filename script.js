document.addEventListener("DOMContentLoaded", function() {
  // Back to Top Button
  const btnTop = document.getElementById("fab-top");

  window.addEventListener("scroll", function() {
    if (window.scrollY > 300) {
      btnTop.classList.add("show");
    } else {
      btnTop.classList.remove("show");
    }
  });

  btnTop.addEventListener("click", function(e) {
    e.preventDefault();
    window.scrollTo({ top: 0, behavior: "smooth" });
  });

  // Table of Contents Generation
  const articleContent = document.querySelector(".article-content");
  const tocContainer = document.getElementById("toc-container");
  const tocList = document.getElementById("toc-list");
  const tocToggle = document.getElementById("toc-toggle");
  const tocIcon = document.getElementById("toc-icon");
  const tocBody = document.getElementById("toc-body");

  if (articleContent && tocContainer) {
    const headings = articleContent.querySelectorAll("h2, h3");

    if (headings.length > 0) {
      headings.forEach((heading, index) => {
        // Generate an ID for the heading if it doesn't have one
        if (!heading.id) {
          heading.id = "heading-" + index;
        }

        const li = document.createElement("li");
        
        // Indent H3 elements
        if (heading.tagName.toLowerCase() === "h3") {
          li.classList.add("toc-h3");
        }

        const a = document.createElement("a");
        a.href = "#" + heading.id;
        a.textContent = heading.textContent;
        
        // Smooth scroll implementation for table of contents
        a.addEventListener("click", function(e) {
          e.preventDefault();
          const targetElement = document.getElementById(this.getAttribute("href").substring(1));
          if (targetElement) {
             // Compensate for fixed navbar
             const yCoordinate = targetElement.getBoundingClientRect().top + window.pageYOffset;
             const yOffset = -80; // Adjust depending on navbar height
             window.scrollTo({ top: yCoordinate + yOffset, behavior: 'smooth' });
          }
        });

        li.appendChild(a);
        tocList.appendChild(li);
      });

      // Toggle functionality mapping H2, H3
      if (tocToggle) {
        tocToggle.addEventListener("click", function() {
          if (tocBody.style.display === "none") {
            tocBody.style.display = "block";
            tocIcon.classList.remove("open");
          } else {
            tocBody.style.display = "none";
            tocIcon.classList.add("open");
          }
        });
      }
    } else {
      // Hide TOC if no headings found
      tocContainer.style.display = "none";
    }
  }
});
