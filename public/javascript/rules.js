const rules = (() => {
  const main = document.querySelector("#game-container");
  const rules = document.querySelector("#game-rules");

  const init = () => {
    if (main) {
      if (window.innerWidth > 900) {
        rules.classList.remove("hide");
      }
      if (window.innerWidth < 900) {
        rules.classList.add("hide");
      }
    }
  };

  const handleResize = (e) => {
    if (main) {
      if (window.innerWidth > 900) {
        rules.classList.remove("hide");
      }
      if (window.innerWidth < 900) {
        rules.classList.add("hide");
      }
    }
  };

  window.addEventListener("resize", handleResize);

  init();

  return {
    init,
  };
})();

export default rules;
