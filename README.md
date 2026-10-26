# iCMServer

iCMServer is the web front end of iCMServer, a modular ASP.NET content management system built by iConsulting around 2003-2004. It runs as an IIS web application: a visitor hits a single entry page, and the server assembles that page at request time from per-site settings, role checks, and a set of content modules dropped into named regions of the layout.

This repository holds the VB.NET source, the deployed `wwwroot` web, the SQL schema, and a generated code-comment report. It is a historical archive — the last commit is from October 2024, but the code itself targets .NET Framework 1.1 and Visual Studio 2003, so it has not been actively developed for two decades.

## What it does

The application serves CMS pages for one or more sites out of a single install. The request flow is:

- `Default.aspx` redirects to `iCM.aspx`.
- `iCM.aspx` reads the current site's settings from the request context (`clsSiteSettings`), checks whether the visitor is in the roles authorized for the requested page, and either renders the page or redirects to `AccessDenied.aspx`.
- The page layout is an HTML table with four module regions — top, left, content, right. Each region is filled by loading the configured module user controls (`.ascx`) into it. Unauthenticated users who request login get the `SignIn` control in the content region.
- Site and page appearance (background image, colour, alignment, width, height) come from the same settings object, so look and layout are data-driven per site and per page.

Admin and content functions are themselves modules. The ones present in this repo include Pages, Sites, Users, Roles, Menu, SignIn, Publisher (an in-browser HTML editor with its own toolbar image set), Documents, Mediagallery, Events, Quicklinks, and iFrame. The `db/install/FsbJurist` install adds further modules — Calendar, Discussion, and Search — so the module set is per-deployment, not fixed.

## Architecture

iCMServer does not talk to the database directly. Data access goes through a SOAP web service called **iCDataManager**, referenced as a web reference (`iCDataObject.asmx`) and configured by URL in `Web.config`. The service exposes a small generic data API — `GetDataSet`, `GetMultiDataSet`, `GetDefinedDataSet`, `GetEmptyDataSet`, `GetDataScalar`, `SaveDataSet`, `SaveBlobData` — so the front end works in terms of typed datasets rather than SQL.

The backing store is selectable. `Web.config` has a `DataSource` key with values `MSSQLServer`, `MSAccess`, or `MySql`, and the `db/` folder ships both SQL Server scripts (`2.0.0_Full.sql` plus incremental `2.0.0.x` security updates) and the matching MySQL versions (`mySQL_2.0.0_Full.sql` and friends). The connection string in `Web.config` is consumed by iCDataManager, not by the web app.

Server-side state is modelled in `Server/Components`:

- `Configuration` — settings classes (`clsSiteSettings`, `clsLanguageSettings`, `clsLanguageText`, `clsMenuDetails`, grid/blob/defined-data lists). Page text is language-aware.
- `Security` — `clsSiteSecurity.IsInRoles` drives the page-level authorization check.
- `ModuleControls` — `clsSiteModuleControl` and a cached variant `clsCachedSiteModuleControl`, the base types modules build on, with output caching support.
- `Global` — image streaming and thumbnailing endpoints.

The compiled output namespace is `iConsulting.iCMServer`; the main assembly is `iConsulting.iCMServer.dll`.

## Tech stack

- VB.NET on ASP.NET Web Forms (`.aspx` pages, `.ascx` user controls, code-behind).
- .NET Framework 1.1 — the project files are Visual Studio 2003 format (`ProductVersion 7.10.3077`, `DefaultTargetSchema = "IE50"`).
- IIS web application; runs from `wwwroot`.
- Data layer over a SOAP web service (iCDataManager) rather than in-process ADO.NET.
- Storage: SQL Server, MySQL, or MS Access, chosen via `Web.config`.
- Client side is classic-era: hand-written JavaScript, the WebFX XLoadTree control for folder trees, coolmenus for navigation, and GIF toolbar icons.

## Related repositories

iCMServer is one part of a three-repo set:

- **iCMComponents** — hosts the iCDataManager web service. The `Web.config` here points `iCDataObject.asmx` at a path under `iCMComponents/wwwroot/iCDataManager/`, which is how the front end and the data layer are wired together.
- **iCMModules** — the standalone module projects. This repo's `Source/2003-09-29 Beta 1/` carries module project folders (`iCMServer.Modules.Events`, `.Pages`, `.Users`, `.Roles`, `.Menu`, `.SignIn`, `.Sites`, `.Publisher`, `.Quicklinks`, `.Mediagallery`, `.iFrame`), each a separate `.vbproj` that compiles to its own `iConsulting.iCMServer.Modules.*.dll`.

The split is front end (this repo) / data service (iCMComponents) / pluggable modules (iCMModules).

## Repository layout

- `Source/2003-09-29 Beta 1/` — VB.NET source, the main `iCMServer` web project plus the module projects. Each module has its own `.sln`.
- `wwwroot/iCMServer/` — the deployed web, including `iCM.aspx`, the `Server/Components` classes, the `Server/Modules` admin modules, and `Web.config`.
- `db/` — SQL Server and MySQL schema scripts; `db/install/FsbJurist/` is a full per-customer install (web + database + extra modules).
- `Leverans/` — packaged releases as `.rar` archives, including `iCMServer.NET 2004-06-09` and a customer build `iCMServer BNISydost 2004-06-28`.
- `Dokument/CodeCommentReport/` — a static HTML code-comment report generated from the source.

## Getting started

This is period software. Running it as-is needs a .NET Framework 1.1 / Visual Studio 2003 environment, which is why the steps below describe the original setup rather than a modern toolchain.

1. Create the database. For SQL Server, run `db/2.0.0_Full.sql`, then apply `db/2.0.0.5_Secutity_Update.sql` through `2.0.0.8`. For MySQL, use the `db/mySQL_*` equivalents.
2. Deploy and host the iCDataManager web service from **iCMComponents**, pointed at that database.
3. Configure `wwwroot/iCMServer/Web.config`:
   - `DataSource` — `MSSQLServer`, `MySql`, or `MSAccess`.
   - `ConnectionString` — consumed by iCDataManager (the default values are local dev placeholders and must be replaced).
   - `iConsulting.iCMServer.iCDataManager.iCDataObject` — the URL of your deployed `iCDataObject.asmx`.
   - `MaxPostedFileContentLength` — upload size cap.
4. Host `wwwroot/iCMServer` as an IIS application on the .NET 1.1 runtime. Browsing the root redirects to `iCM.aspx`, which renders the active site's page.

To open the source, load `Source/2003-09-29 Beta 1/iCMServer/iCMServer.sln` (and the per-module `.sln` files) in Visual Studio 2003.

## Status

Archived / historical. The codebase is .NET Framework 1.1 from the early 2000s and is here as a record of the iCMServer product, not as something to deploy on current infrastructure. The connection strings and credentials committed in `Web.config` are old development values; treat them as dead, not as live secrets.

## Copyright

The iCMServer engine source code is copyright iConsulting (see `AssemblyInfo.vb`). All rights reserved.
