import {
    BrowserRouter,
    Route,
    Routes,
} from "react-router-dom";

import App from "./App";
import Blog from "./routes/blog";
import Login from "./routes/login";
import ReactDOM from "react-dom/client";
import Register from "./routes/register";

const root = ReactDOM.createRoot(
  document.getElementById("root")
);
root.render(  <BrowserRouter>
        <Routes>
      <Route path="/" element={<App />} >
            <Route path="register" element={<Register />} />
            <Route path="login" element={<Login />} />
            <Route path="blog" element={<Blog />} />
        </Route>
    </Routes>
  </BrowserRouter>);