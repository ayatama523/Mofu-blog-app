import React from "react"
import ReactDOM from "react-dom"
// import moment from "moment"

import App from "./App"

// moment.locale("ja")

document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("admin-pages")
  if (el !== null) {
    const config = JSON.parse(el.dataset.config || "{}")
    ReactDOM.render(<App config={config} />, el)
  }
})
