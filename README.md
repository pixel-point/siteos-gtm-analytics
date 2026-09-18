# SiteOS Analytics for Google Tag Manager

Install SiteOS Analytics and send registered events through Google Tag Manager. The template
loads the same Analytics runtime as the direct website snippet and uses your Project environment's
published configuration.

This repository is prepared for the Community Template Gallery. A Gallery listing is not yet
confirmed. Until it is available, import `template.tpl` manually.

## Installation

1. Enable SiteOS Analytics for the intended Project environment in [SiteOS](https://app.siteos.sh).
   Copy its Analytics public key and runtime URL from the installation instructions.
2. In GTM, open **Templates → Tag Templates → New → More → Import**, select `template.tpl`,
   review the permissions and save the template.
3. Create a **SiteOS Analytics** tag with action **Initialize / update consent**. Enter the public
   key and runtime URL for that environment. The public key identifies collection, not report access.
4. Configure the consent option described below. Use **Initialization – All Pages**. When using
   a consent manager, initialize it first through **Consent Initialization – All Pages**.
5. Preview and verify collection before publishing your container. Install Analytics once:
   use the direct snippet or GTM, and remove a replaced installation as part of your migration.

Importing this template does not publish your GTM container or enable Analytics in SiteOS.
It collects into SiteOS Analytics; it does not install Google Analytics / GA4.

## Consent

- **Standalone Analytics:** leave **Use external consent manager** off. The runtime follows the
  published Analytics configuration; attaching a Cookie service does not itself enable consent control.
- **SiteOS Cookie:** explicitly enable and publish its SiteOS Analytics integration for the same
  Project environment. Leave **Use external consent manager** off. The runtime waits for the matching
  Cookie configuration and applies its regional permissions, saved choices and withdrawal.
- **Another consent manager:** enable **Use external consent manager** before the first initialization.
  Map **Current Analytics consent** to its explicit boolean `true`/`false` or `granted`/`denied` value.
  Unknown, empty and other values deny detailed collection. Fire **Initialize / update consent**
  on every choice change, including refusal and withdrawal. Do not add a GTM consent requirement
  that prevents a withdrawal update from running. The template does not infer a grant from an
  unset Google consent state.

Denial blocks detailed pageviews and custom events. Published minimal anonymous pageviews and
optional minimal realtime can continue without detailed consent. Anonymous pageviews have no path,
visitor/visit link or event properties. GPC, DNT and full Analytics opt-out stop both collection paths.
Native Cookie consent, when configured, cannot be bypassed by granting an external consent variable.
These controls do not configure consent for other Google or non-Google tags.

## Send an event

Register the event code and categorical properties in SiteOS first. Create another tag using this
template with action **Send an event**, the same public key, the event code and its declared property
rows (at most eight). For example: `trial_started` with `plan: pro`, if those values are registered.

Fire the event after the business action actually succeeds and after the initialization tag has
completed. Unregistered events/properties, events before readiness and events without detailed
permission are dropped, not replayed later. Never map names, emails, form contents or personal
identifiers into properties. The template does not copy the data layer wholesale.

## Permissions

- Inject only `https://app.siteos.sh/analytics.js` or `https://siteosapp.xui.se/analytics.js`.
- Execute `SiteOSAnalyticsLoader.init` and `SiteOSAnalyticsLoader.track`.

The template does not read/write browser globals or cookies directly. The shared runtime owns
configuration, consent enforcement and event delivery. Another application host requires a reviewed
local change to the exact script permission; do not use an unrestricted host wildcard.

## Verify before publishing

Use Preview / Tag Assistant and the Analytics reports to verify:

- Standalone initialization works without a Cookie installation and does not double-install.
- An external CMP's initial unknown state, grant and withdrawal reach the runtime on the same page.
- Native Cookie uses the matching published integration and does not grant from attachment alone.
- A registered event reaches the intended environment with only its declared properties.
- Denied detailed collection, configured anonymous measurement and GPC/DNT/full opt-out behave as expected.
- A failed script load or invalid key reports initialization failure.

Tag success confirms execution, not durable delivery. An event tag can run while the runtime rejects
its event. Confirm collection in Analytics; use SiteOS Trace for additional evidence when configured.
The embedded tests use mocks and do not replace this website acceptance.

## Maintenance

This repository is a generated distribution of `pixel-point/siteos-platform`. The canonical template
is `packages/analytics-runtime/public/integrations/gtm/siteos-analytics.tpl`; documentation, license,
verification and immutable version history are in that package's `gallery/` directory.
Change the monorepo and use `pnpm analytics:gtm:sync`; do not maintain a second editable template here.

`publication.json` records the source revision, source-file cleanliness and file hashes.
`metadata.yaml` references template commits from this distribution repository, not the monorepo.
Run `node scripts/verify.mjs` with Node.js 22+ to verify its files and history. Add `--release` to
require a recorded version matching the current template and committed source files.

Gallery updates require a new recorded template version. Users choose whether to apply them.
The shared runtime is delivered separately; routine runtime changes do not automatically require
a new template version. An imported template does not update just because this repository changes.

Report problems in [GitHub Issues](https://github.com/pixel-point/siteos-gtm-analytics/issues).

## License

The distributed files are provided under Apache License 2.0; see `LICENSE`.
This license does not relicense the SiteOS application or grant rights to its brand.
