___TERMS_OF_SERVICE___
By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.
___INFO___
{
  "type": "TAG",
  "id": "siteos_analytics_v1",
  "version": 1,
  "securityGroups": [],
  "displayName": "SiteOS Analytics",
  "brand": {
    "id": "siteos",
    "displayName": "SiteOS",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAMAAADVRocKAAAAXVBMVEUICAoAAAH///8HBwkICAoICAoJCQsICAoICApMaXEKCgz29vf5+fn7+/sMDA74+PhYWFkmJidra2x6ensUFBbd3d27u7zPz9CpqaqOjo/9/f1ISEnr6+ucnJw4ODpxYYYrAAAACnRSTlP3////ujj/N8EAe8IfqgAAAAlwSFlzAABxYwAAcWMBNfmKzAAAAxJJREFUeJztWtmO2zAMNMldZUPKku8zyf9/ZkHZm7RAAalbuWhRz4Od5EFjXkMycHG9fBTmEDAVH+/X4sKGjyEgZsPvxYdRA47gYKLCvBXFQc+vYGOKox7/iYMC/EJxqAH8Zyw4FsXB55uTIIrTRVGcLoridFEUp4ui+L9cRD/5lI+ADDtnSMGOsxMQMRMAua5zDPoh1Yo0AjIOoKvmYez7fpza1QEx5SMgNlDfb/jC2DhwRJkIiAlawUVEvPdeb4jjA1wmAmIyE5bi7QsiKFUSQ4oFDHcMx3uxtgxXawX9AxLiECcgBw3uZ+LixSJaZRMcHcVzKUpAhro+EHjs27WuH9VkcWNowGWwwEEVzhecHGxYb4vXHwYwGQgYZiXw2HfgmJldoBQRe6uBcxAMSiB437OGDNO4lcOalWB+piVT1QbktWAk2mJKZPZg5MgiE6ogBPlOsCup3jQaCYqXnkXW41h1+thKsp+cgYCedaCF1k/NQ5M16eETLSCGCu3GIIjo+6mp1Y4kMU3UohY3MbJeVCpQhspAmhEpamoYqpuq9aanXqREHLUGMqkpGYZ6vgWpC67anNVCliAriBxA3Qza0xa/GSIW53iZpTd91typ1zmQ7M0BU1pO+tjC2zhRr3OP5ash/D4BsQvQULBTkega2RvCGjchRkA/6k4gIVilDARzvOMkWLA2ATXxc8Tb5ElwyqCmDNOm/c3THeSgzUkwh/aF06t0s1rgPsV0qWAXaQf1TfMoSwyI9TRN+0WqPdzwGPcOkVAIKQ1n2qaWBYcmjC13+Rxjuhx1wFBLGQ70iKVGA8NXK9hmmYtIJ7vPfmDLUq/b+UNKR0jvB/Ld7Bu0buhSdoTUftAj2tf4LiUus0uZfZP7QdeOy3cLyG16JO44qf2AwD3aaVuhhrmqAThth0rvB6SC13VdF0ZgTuqXX19jOXlV/tVFnJn/4b8SvoSTIIrTRVGcLoridFEUp4uiOF30F7iI99XrEDBxkfon95dATMWBJrB66NBXT4y+enI5LATqGX4vrpe3417/eXu/fgMh+umM7NkebAAAAABJRU5ErkJggg=="
  },
  "description": "Initialize SiteOS Analytics with scoped external consent, or send a registered event using the shared runtime.",
  "containerContexts": [
    "WEB"
  ],
  "categories": [
    "ANALYTICS"
  ]
}
___TEMPLATE_PARAMETERS___
[
  {
    "type": "TEXT",
    "name": "permissionSnapshots",
    "displayName": "External recognition / identity permissions (optional)",
    "simpleValueType": true,
    "help": "Map an array of original scoped CMP records for the active Analytics policy. Keep Use external consent manager off unless you also intend a separate website-details gate. Empty/denied records withdraw permission; never create grant times on reload. Leave empty with SiteOS Cookie. No identifiers, emails or signed assertions.",
    "enablingConditions": [{ "paramName": "mode", "type": "EQUALS", "paramValue": "init" }, { "paramName": "visitorRecognition", "type": "EQUALS", "paramValue": true }]
  },
  {
    "type": "TEXT",
    "name": "identityEndpoint",
    "displayName": "Website identity backend (optional)",
    "simpleValueType": true,
    "defaultValue": "",
    "help": "Same-origin path, for example /api/analytics/identity. Requires visitor recognition, a separately activated identity policy and permission, and your backend's registered signing key. Your website calls identify after resolving its own account or accepted submission, and resetIdentity before logout/account changes. Never pass email, account IDs or assertions through GTM variables.",
    "enablingConditions": [{ "paramName": "mode", "type": "EQUALS", "paramValue": "init" }, { "paramName": "visitorRecognition", "type": "EQUALS", "paramValue": true }]
  },
  {
    "type": "CHECKBOX",
    "name": "visitorRecognition",
    "checkboxText": "Install visitor recognition support",
    "simpleValueType": true,
    "defaultValue": false,
    "help": "Requires a reviewed active Analytics policy and fresh scoped permission. This installation option alone never enables recognition. Native SiteOS Cookie supplies the published scope; use External recognition / identity permissions for an external CMP.",
    "enablingConditions": [{ "paramName": "mode", "type": "EQUALS", "paramValue": "init" }]
  },
  {
    "type": "RADIO",
    "name": "mode",
    "displayName": "Action",
    "simpleValueType": true,
    "defaultValue": "init",
    "radioItems": [
      {
        "displayValue": "Initialize / update consent",
        "value": "init"
      },
      {
        "displayValue": "Send an event",
        "value": "event"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "publicKey",
    "displayName": "Analytics public key",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "^ana_[A-Za-z0-9_-]{20,80}$"
        ]
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "runtimeUrl",
    "displayName": "Runtime URL",
    "simpleValueType": true,
    "defaultValue": "https://app.siteos.sh/analytics.js",
    "help": "Copy the script URL from Analytics Setup. Permissions allow the exact SiteOS production and staging URLs.",
    "enablingConditions": [
      {
        "paramName": "mode",
        "type": "EQUALS",
        "paramValue": "init"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "externalConsent",
    "checkboxText": "Require external consent for website details",
    "simpleValueType": true,
    "defaultValue": false,
    "help": "This adds a separate website-details gate. Leave off for standalone Analytics, recognition-only external permission, or the published SiteOS Cookie integration.",
    "enablingConditions": [{ "paramName": "mode", "type": "EQUALS", "paramValue": "init" }]
  },
  {
    "type": "TEXT",
    "name": "consentBinding",
    "displayName": "CMP binding key",
    "simpleValueType": true,
    "defaultValue": "",
    "help": "Required for an external CMP. Stable key for this website's CMP configuration, not a visitor or receipt ID.",
    "enablingConditions": [
      {
        "paramName": "mode",
        "type": "EQUALS",
        "paramValue": "init"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "consentPurpose",
    "displayName": "Website measurement purpose key",
    "simpleValueType": true,
    "help": "The exact purpose disclosed by your CMP. This controls website details, not visitor recognition.",
    "enablingConditions": [{ "paramName": "mode", "type": "EQUALS", "paramValue": "init" }]
  },
  {
    "type": "TEXT",
    "name": "consentPolicy",
    "displayName": "Material policy version",
    "simpleValueType": true,
    "help": "Expected published purpose/disclosure version. Configure this value independently of the visitor's consent variable. Change it when the disclosed processing changes.",
    "enablingConditions": [{ "paramName": "mode", "type": "EQUALS", "paramValue": "init" }]
  },
  {
    "type": "TEXT",
    "name": "consentSnapshot",
    "displayName": "Scoped consent snapshot",
    "simpleValueType": true,
    "help": "Map a CMP adapter variable returning the versioned snapshot object: schemaVersion 1, resourceKey, scope website, bindingKey, purposeKey, policyVersion, status and original grantedAt/expiresAt in epoch milliseconds for granted status. No booleans, receipt IDs or renewal on page load. Fire on Initialization and every update, including withdrawal.",
    "enablingConditions": [{ "paramName": "mode", "type": "EQUALS", "paramValue": "init" }]
  },
  {
    "type": "TEXT",
    "name": "eventName",
    "displayName": "Event code",
    "simpleValueType": true,
    "defaultValue": "",
    "help": "Use a registered event code. Fire only when the real action succeeds.",
    "enablingConditions": [
      {
        "paramName": "mode",
        "type": "EQUALS",
        "paramValue": "event"
      }
    ]
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "properties",
    "displayName": "Declared properties",
    "help": "Use only registered categorical values. Never add names, emails, form values or identifiers. Maximum 8 rows.",
    "enablingConditions": [
      {
        "paramName": "mode",
        "type": "EQUALS",
        "paramValue": "event"
      }
    ],
    "simpleTableColumns": [
      {
        "type": "TEXT",
        "name": "key",
        "displayName": "Property",
        "isUnique": true
      },
      {
        "type": "TEXT",
        "name": "value",
        "displayName": "Value"
      }
    ]
  }
]
___SANDBOXED_JS_FOR_WEB_TEMPLATE___
const injectScript = require('injectScript');
const callInWindow = require('callInWindow');
const copyFromWindow = require('copyFromWindow');

if (data.mode === 'init') {
  if (data.identityEndpoint && data.visitorRecognition !== true) { data.gtmOnFailure(); return; }
  // The configured expectation is independent of the visitor's current snapshot.
  const consent = data.externalConsent === true ? {
    policy: {
      schemaVersion: 1,
      resourceKey: data.publicKey,
      scope: 'website',
      bindingKey: data.consentBinding,
      purposeKey: data.consentPurpose,
      policyVersion: data.consentPolicy
    },
    snapshot: data.consentSnapshot
  } : undefined;
  injectScript(data.runtimeUrl, () => {
    if (copyFromWindow('SiteOSAnalyticsLoader.scopedConsentVersion') !== 1) { data.gtmOnFailure(); return; }
    if (data.visitorRecognition === true) {
      if (copyFromWindow('SiteOSAnalyticsLoader.recognitionVersion') !== 1) { data.gtmOnFailure(); return; }
      if (copyFromWindow('SiteOSAnalyticsLoader.permissionsVersion') !== 1) { data.gtmOnFailure(); return; }
      const options = { permissionVersion: 1, recognition: true };
      if (data.permissionSnapshots) {
        if (copyFromWindow('SiteOSAnalyticsLoader.initialPermissionsVersion') !== 1) { data.gtmOnFailure(); return; }
        options.permissions = data.permissionSnapshots;
      }
      if (data.identityEndpoint) {
        if (copyFromWindow('SiteOSAnalyticsLoader.identityVersion') !== 1) { data.gtmOnFailure(); return; }
        options.identity = { version: 1, endpoint: data.identityEndpoint };
      }
      callInWindow('SiteOSAnalyticsLoader.init', data.publicKey, consent, () => {
        if (callInWindow('SiteOSAnalyticsLoader.setPermissions', data.publicKey, data.permissionSnapshots || data.consentSnapshot || null) !== true) { data.gtmOnFailure(); return; }
        data.gtmOnSuccess();
      }, data.gtmOnFailure, options);
    } else {
      callInWindow('SiteOSAnalyticsLoader.init', data.publicKey, consent, data.gtmOnSuccess, data.gtmOnFailure);
    }
  }, data.gtmOnFailure, 'siteos-analytics-runtime-v1');
} else if (data.mode === 'event') {
  if (copyFromWindow('SiteOSAnalyticsLoader.scopedConsentVersion') !== 1) { data.gtmOnFailure(); return; }
  const rows = data.properties || [];
  if (rows.length > 8) { data.gtmOnFailure(); return; }
  const properties = {};
  for (let i = 0; i < rows.length; i++) {
    const row = rows[i];
    if (!row.key || row.key === '__proto__' || row.key === 'constructor' || row.key === 'prototype' || typeof row.value !== 'string') { data.gtmOnFailure(); return; }
    properties[row.key] = row.value;
  }
  // The runtime drops events without consent or a matching catalog entry. Nothing is buffered here.
  callInWindow('SiteOSAnalyticsLoader.track', data.publicKey, data.eventName, properties);
  data.gtmOnSuccess();
} else { data.gtmOnFailure(); }

___WEB_PERMISSIONS___
[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://app.siteos.sh/analytics.js"
              },
              {
                "type": 1,
                "string": "https://siteosapp.xui.se/analytics.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}],
                "mapValue": [{"type":1,"string":"SiteOSAnalyticsLoader.permissionsVersion"},{"type":8,"boolean":true},{"type":8,"boolean":false},{"type":8,"boolean":false}]
              },
              {
                "type": 3,
                "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}],
                "mapValue": [{"type":1,"string":"SiteOSAnalyticsLoader.initialPermissionsVersion"},{"type":8,"boolean":true},{"type":8,"boolean":false},{"type":8,"boolean":false}]
              },
              {
                "type": 3,
                "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}],
                "mapValue": [{"type":1,"string":"SiteOSAnalyticsLoader.setPermissions"},{"type":8,"boolean":false},{"type":8,"boolean":false},{"type":8,"boolean":true}]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "SiteOSAnalyticsLoader.init"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "SiteOSAnalyticsLoader.track"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "SiteOSAnalyticsLoader.scopedConsentVersion"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "key" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" },
                  { "type": 1, "string": "execute" }
                ],
                "mapValue": [
                  { "type": 1, "string": "SiteOSAnalyticsLoader.recognitionVersion" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": false },
                  { "type": 8, "boolean": false }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "key" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" },
                  { "type": 1, "string": "execute" }
                ],
                "mapValue": [
                  { "type": 1, "string": "SiteOSAnalyticsLoader.identityVersion" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": false },
                  { "type": 8, "boolean": false }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]
___TESTS___
scenarios:
- name: External recognition permissions do not add a website gate
  code: |-
    const snapshot = [{schemaVersion: 1, scope: 'recognition', resourceKey: 'ana_abcdefghijklmnopqrstuvwxyz', status: 'denied'}];
    mock('copyFromWindow', () => 1);
    mock('injectScript', (url, ready) => ready());
    mock('callInWindow', (path, key, consent, ready) => {
      if (path === 'SiteOSAnalyticsLoader.init') {
        assertThat(consent).isEqualTo(undefined);
        ready();
      } else {
        assertThat(path).isEqualTo('SiteOSAnalyticsLoader.setPermissions');
        assertThat(consent).isEqualTo(snapshot);
        return true;
      }
    });
    runCode({mode: 'init', publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js', visitorRecognition: true, permissionSnapshots: snapshot});
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
- name: Recognition installation requires the exact loader capability
  code: |-
    mock('injectScript', (url, ready) => ready());
    mock('copyFromWindow', (key) => key === 'SiteOSAnalyticsLoader.scopedConsentVersion' ? 1 : undefined);
    runCode({ mode: 'init', publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', visitorRecognition: true });
    assertApi('callInWindow').wasNotCalled();
    assertApi('gtmOnFailure').wasCalled();
- name: Unknown external snapshot is not promoted to a grant
  code: |-
    mock('injectScript', (url, ready) => ready());
    mock('copyFromWindow', (key) => { assertThat(key).isEqualTo('SiteOSAnalyticsLoader.scopedConsentVersion'); return 1; });
    const snapshot = undefined;
    mock('callInWindow', (name, key, consent, ready) => {
      assertThat(name).isEqualTo('SiteOSAnalyticsLoader.init');
      assertThat(consent.policy).isEqualTo({ schemaVersion: 1, resourceKey: 'ana_abcdefghijklmnopqrstuvwxyz', scope: 'website', bindingKey: 'cmp-example', purposeKey: 'website-analytics', policyVersion: 'material-2' });
      assertThat(consent.snapshot).isEqualTo(snapshot);
      ready();
    });
    runCode({ mode: 'init', publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js', externalConsent: true, consentBinding: 'cmp-example', consentPurpose: 'website-analytics', consentPolicy: 'material-2', consentSnapshot: snapshot });
    assertApi('callInWindow').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Scoped grant preserves original evidence
  code: |-
    mock('injectScript', (url, ready) => ready());
    mock('copyFromWindow', (key) => { assertThat(key).isEqualTo('SiteOSAnalyticsLoader.scopedConsentVersion'); return 1; });
    const snapshot = { schemaVersion: 1, resourceKey: 'ana_abcdefghijklmnopqrstuvwxyz', scope: 'website', bindingKey: 'cmp-example', purposeKey: 'website-analytics', policyVersion: 'material-2', status: 'granted', grantedAt: 1000, expiresAt: 2000 };
    mock('callInWindow', (name, key, consent, ready) => {
      assertThat(name).isEqualTo('SiteOSAnalyticsLoader.init');
      assertThat(consent.policy).isEqualTo({ schemaVersion: 1, resourceKey: 'ana_abcdefghijklmnopqrstuvwxyz', scope: 'website', bindingKey: 'cmp-example', purposeKey: 'website-analytics', policyVersion: 'material-2' });
      assertThat(consent.snapshot).isEqualTo(snapshot);
      ready();
    });
    runCode({ mode: 'init', publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js', externalConsent: true, consentBinding: 'cmp-example', consentPurpose: 'website-analytics', consentPolicy: 'material-2', consentSnapshot: snapshot });
    assertApi('callInWindow').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Scoped withdrawal reaches the runtime
  code: |-
    mock('injectScript', (url, ready) => ready());
    mock('copyFromWindow', (key) => { assertThat(key).isEqualTo('SiteOSAnalyticsLoader.scopedConsentVersion'); return 1; });
    const snapshot = { schemaVersion: 1, resourceKey: 'ana_abcdefghijklmnopqrstuvwxyz', scope: 'website', bindingKey: 'cmp-example', purposeKey: 'website-analytics', policyVersion: 'material-2', status: 'denied' };
    mock('callInWindow', (name, key, consent, ready) => {
      assertThat(name).isEqualTo('SiteOSAnalyticsLoader.init');
      assertThat(consent.policy).isEqualTo({ schemaVersion: 1, resourceKey: 'ana_abcdefghijklmnopqrstuvwxyz', scope: 'website', bindingKey: 'cmp-example', purposeKey: 'website-analytics', policyVersion: 'material-2' });
      assertThat(consent.snapshot).isEqualTo(snapshot);
      ready();
    });
    runCode({ mode: 'init', publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js', externalConsent: true, consentBinding: 'cmp-example', consentPurpose: 'website-analytics', consentPolicy: 'material-2', consentSnapshot: snapshot });
    assertApi('callInWindow').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Standalone and native Cookie delegate to the published policy
  code: |-
    mock('injectScript', (url, ready) => ready());
    mock('copyFromWindow', () => 1);
    mock('callInWindow', (name, key, consent, ready) => { assertThat(consent).isEqualTo(undefined); ready(); });
    runCode({ mode: 'init', externalConsent: false, publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js' });
    assertApi('callInWindow').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Incompatible runtime cannot receive init
  code: |-
    mock('injectScript', (url, ready) => ready());
    mock('copyFromWindow', () => undefined);
    runCode({ mode: 'init', externalConsent: true, publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js', consentSnapshot: { status: 'denied' } });
    assertApi('callInWindow').wasNotCalled();
    assertApi('gtmOnFailure').wasCalled();
    assertApi('gtmOnSuccess').wasNotCalled();
- name: Incompatible runtime cannot receive event
  code: |-
    mock('injectScript', (url, ready) => ready());
    mock('copyFromWindow', () => undefined);
    runCode({ mode: 'event', externalConsent: true, publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js', consentSnapshot: { status: 'denied' } });
    assertApi('callInWindow').wasNotCalled();
    assertApi('gtmOnFailure').wasCalled();
    assertApi('gtmOnSuccess').wasNotCalled();
- name: Events forward only configured properties
  code: |-
    mock('copyFromWindow', () => 1);
    mock('callInWindow', () => {});
    runCode({ mode: 'event', publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', eventName: 'trial_started', properties: [{ key: 'plan', value: 'pro' }], email: 'private@example.com' });
    assertApi('callInWindow').wasCalledWith('SiteOSAnalyticsLoader.track', 'ana_abcdefghijklmnopqrstuvwxyz', 'trial_started', { plan: 'pro' });
    assertApi('injectScript').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Script load failure reports failure
  code: |-
    mock('injectScript', (url, ready, failed) => failed());
    runCode({ mode: 'init', publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js' });
    assertApi('callInWindow').wasNotCalled();
    assertApi('gtmOnFailure').wasCalled();

___NOTES___
SiteOS Analytics template v2 preparation; Gallery approval is not represented. Requires a loader advertising scopedConsentVersion 1; unsupported or missing versions fail without invoking collection APIs. Deploy and verify the matching runtime before updating the owned template/container. Replace the previous boolean-consent tag with this scoped contract together with the runtime. Import under Templates > Tag Templates > New > Import. Use Initialization - All Pages after your CMP sets defaults. With an external CMP, configure the expected binding, website purpose and material policy version independently of the visitor snapshot. Also trigger Initialize / update consent on every choice change (including denial). Preserve the CMP's original grant and expiry; never generate them on page load. Missing/mismatched/expired evidence denies details. Changing the installation policy in a loaded page requires reload; conflicting initializers stop collection. Do not add a consent requirement that prevents the withdrawal tag from executing. Native SiteOS Cookie remains authoritative when its published integration is enabled. This template does not enable visitor recognition. Sequence event tags after initialization, trigger on confirmed business actions, and verify grants, denials, withdrawal and delivery in Tag Assistant. Tag success confirms execution, not durable event delivery. See Analytics and Trace for delivery evidence. Documentation: https://github.com/pixel-point/siteos-gtm-analytics#installation
