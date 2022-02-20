import React from "react"
import ReactDOM from "react-dom"

import PostsEdit from "./pages/posts/edit"

document.addEventListener("turbolinks:load", () => {
  const postsEdit = document.getElementById("admin-posts-edit")
  if (postsEdit) {
    const dataset = (postsEdit as HTMLElement).dataset
    const config = JSON.parse(dataset.config || "{}")
    ReactDOM.render(
      <PostsEdit
        config={config}
        postId={dataset.postId}
      />,
      postsEdit
    )
  }
});
