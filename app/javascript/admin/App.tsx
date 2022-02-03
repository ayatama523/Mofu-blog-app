import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";

import Posts from './posts'

type Props = {
  config: any
};

const App: React.FC<Props> = (props) => {
  const { config } = props
  // const searchParams = new URLSearchParams(window.location.search)

  return (
    <Router>
      <main className="container">
        <Switch>
          <Route
            path="/admin/posts/:postId"
            render={(props: JSX.IntrinsicAttributes) => (
              <Posts config={config} {...props} />
            )}
          />
        </Switch>
      </main>
    </Router>
  )
}

export default App
