import { Pages } from "../pages.js";

const name = window._application.path
  .replace(/^\//, "") // trim initial slash
  .replace(/\/$/, "") // trim trailing slash
  .replace(/^$/, "index"); // "index" for "/"

const ViewProps = window._application.props;
const Page = Pages[name];

export { Page, ViewProps };
