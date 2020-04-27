import { Pages } from "~/pages";

const name = window._application.path
  .replace(/^\//, "") // trim initial slash
  .replace(/\/$/, "") // trim trailing slash
  .replace(/^$/, "index"); // "index" for "/"

const PageProps = window._application.props;
const Page = Pages[name];

export { Page, PageProps };
