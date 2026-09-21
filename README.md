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
  Configure **CMP binding key**, **Website measurement purpose key** and **Material policy version**
  from the installation's expected policy, independently of the visitor's stored choice. Map
  **Scoped consent snapshot** to the original CMP record projected as below. Fire **Initialize / update consent**
  on every choice change, including refusal and withdrawal. Do not add a GTM consent requirement
  that prevents a withdrawal update from running. The template does not infer a grant from an
  unset Google consent state.

The previous boolean consent field is no longer supported. The snapshot uses
`schemaVersion: 1`, the exact `resourceKey`, `scope: "website"`, `bindingKey`, `purposeKey`,
`policyVersion` and `status: "granted" | "denied" | "unknown"`. A grant additionally contains
the original `grantedAt` and `expiresAt` Unix timestamps in milliseconds. Match the keys against
the independently configured expectation. Missing, mismatched or expired evidence does not permit
details. A regional default is not an affirmative grant. Never manufacture timestamps on page load,
renew a grant on reload, or map a receipt ID, email or visitor ID into these fields. A CMP that
cannot supply this evidence needs an explicit adapter; a generic boolean cannot be upgraded to it.

Changing the expected installation policy on an already loaded page requires a reload. Conflicting
initializers stop collection. Re-grant does not replay events queued before withdrawal or expiry.
The external template fields above control website details only; they cannot grant recognition.

### Visitor recognition preparation

The optional **Install visitor recognition support** checkbox requires a runtime advertising
numeric `recognitionVersion: 1`. Leave it off unless the exact environment has a separately
reviewed active recognition policy. It does not activate that policy, publish Cookie or obtain
consent. With scoped native Cookie, only a fresh affirmative recognition choice enables the
first-party identity cookie. Refusal preserves an independently permitted cookieless base.
General website grants and regional defaults never authorize identity. Current effective bounds
are 30 days from the original recognition grant (no automatic renewal) and 30-day event history.
External recognition requires a reviewed server-side purpose and the runtime's scoped
`setConsent` adapter; the template's website snapshot is not that adapter.
Owner mode controls and recognition reports are still in development; this is not release approval.

If website-details consent is separately required, denying that scope blocks detailed pageviews
and custom events. Only the configured minimal pageview/realtime fallback can continue; minimal
pageviews have no path, visitor/visit link or event properties. This is different from refusing
recognition alone, which preserves the independently permitted cookieless base. GPC, DNT and full
Analytics opt-out stop both layers. Required native Cookie permission cannot be bypassed by granting
an external consent variable. These controls do not configure consent for other tags.

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
- Read only `SiteOSAnalyticsLoader.scopedConsentVersion` and `SiteOSAnalyticsLoader.recognitionVersion`
  to check the selected runtime capabilities.

The template does not write browser globals or read/write cookies. The shared runtime owns
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
- A loader without numeric `scopedConsentVersion: 1` fails before init or event APIs are invoked.
- Recognition opt-in refuses a loader without numeric `recognitionVersion: 1`; verify no identity
  before consent, fixed expiry across reload, withdrawal and continued permitted base collection.
- Expired or mismatched purpose/policy evidence cannot open collection; withdrawal during loading wins.

Tag success confirms execution, not durable delivery. An event tag can run while the runtime rejects
its event. Confirm collection in Analytics; use SiteOS Trace for additional evidence when configured.
The embedded tests use mocks and do not replace this website acceptance.

## Maintenance

This is preparation for the scoped-consent template update, not a released Gallery version.
Deploy and verify the matching runtime first, then update the owned template and tag fields and
verify them in Preview before publishing the container. The new template fails on an older runtime;
the older external-CMP template fails on the new runtime. Do not expect uninterrupted collection
across a mixed-version rollout. Existing standalone/native tags should still be upgraded to this
reviewed template. Importing/updating the template alone does not configure the new CMP fields.

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
