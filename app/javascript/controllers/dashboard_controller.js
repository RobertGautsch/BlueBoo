import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    end: Number,
    title: String
  }

  static targets = ["counter", "title"]

  connect() {
    let start = 0
    const myInterval = setInterval(()=>{
      start += 1
      this.counterTarget.innerHTML = start
      if (start === this.endValue) {
        this.counterTarget.innerHTML = start
        this.#fade();
        clearInterval(myInterval)
      }
    }, Math.floor(Math.random() * (300 - 100 + 1) + 100))
}
    #fade() {
      var op = 0.1;  // initial opacity
      var timer = setInterval(() => {
          if (op >= 1){
              clearInterval(timer);
          }
          this.titleTarget.innerHTML = this.titleValue
          this.titleTarget.style.visibility = "visible"
          this.titleTarget.style.opacity = op;
          this.titleTarget.style.filter = 'alpha(opacity=' + op * 100 + ")";
          op += op * 0.1;
      }, 40);
   }
}
