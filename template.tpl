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
  "description": "Initialize SiteOS Analytics, update external consent, or send a registered event using the shared Analytics runtime.",
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
    "checkboxText": "Use external consent manager",
    "simpleValueType": true,
    "defaultValue": false,
    "help": "Enable only for an external CMP. Leave off for standalone Analytics or the published SiteOS Cookie integration.",
    "enablingConditions": [{ "paramName": "mode", "type": "EQUALS", "paramValue": "init" }]
  },
  {
    "type": "TEXT",
    "name": "consent",
    "displayName": "Current Analytics consent",
    "simpleValueType": true,
    "defaultValue": "",
    "help": "Used only when Use external consent manager is enabled. Map its current boolean consent variable (true or granted). Unknown and empty then deny detailed collection and custom events. Published anonymous pageviews and minimal realtime settings still apply. Fire on Initialization and every consent update, including withdrawal.",
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

if (data.mode === 'init') {
  // An external gate is explicit. Empty consent denies only when that gate is enabled.
  const consent = data.externalConsent === true ? (data.consent === true || data.consent === 'granted') : undefined;
  injectScript(data.runtimeUrl, () => {
    callInWindow('SiteOSAnalyticsLoader.init', data.publicKey, consent, data.gtmOnSuccess, data.gtmOnFailure);
  }, data.gtmOnFailure, 'siteos-analytics-runtime-v1');
} else if (data.mode === 'event') {
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
- name: Unknown external consent stays denied
  code: |-
    mock('injectScript', (url, ready) => ready());
    mock('callInWindow', (name, key, consent, ready) => {
      assertThat(name).isEqualTo('SiteOSAnalyticsLoader.init');
      assertThat(key).isEqualTo('ana_abcdefghijklmnopqrstuvwxyz');
      assertThat(consent).isEqualTo(false);
      ready();
    });
    const mockData = { mode: 'init', externalConsent: true, publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js' };
    runCode(mockData);
    assertApi('callInWindow').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Explicit external grant reaches the runtime
  code: |-
    mock('injectScript', (url, ready) => ready());
    mock('callInWindow', (name, key, consent, ready) => {
      assertThat(name).isEqualTo('SiteOSAnalyticsLoader.init');
      assertThat(key).isEqualTo('ana_abcdefghijklmnopqrstuvwxyz');
      assertThat(consent).isEqualTo(true);
      ready();
    });
    const mockData = { mode: 'init', externalConsent: true, consent: 'granted', publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js' };
    runCode(mockData);
    assertApi('callInWindow').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: External withdrawal reaches the runtime
  code: |-
    mock('injectScript', (url, ready) => ready());
    mock('callInWindow', (name, key, consent, ready) => {
      assertThat(name).isEqualTo('SiteOSAnalyticsLoader.init');
      assertThat(key).isEqualTo('ana_abcdefghijklmnopqrstuvwxyz');
      assertThat(consent).isEqualTo(false);
      ready();
    });
    const mockData = { mode: 'init', externalConsent: true, consent: 'denied', publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js' };
    runCode(mockData);
    assertApi('callInWindow').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Standalone and native Cookie keep their published policy
  code: |-
    mock('injectScript', (url, ready) => ready());
    mock('callInWindow', (name, key, consent, ready) => {
      assertThat(name).isEqualTo('SiteOSAnalyticsLoader.init');
      assertThat(key).isEqualTo('ana_abcdefghijklmnopqrstuvwxyz');
      assertThat(consent).isEqualTo(undefined);
      ready();
    });
    const mockData = { mode: 'init', externalConsent: false, consent: 'denied', publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js' };
    runCode(mockData);
    assertApi('callInWindow').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Events forward only configured properties
  code: |-
    mock('callInWindow', () => {});
    const mockData = { mode: 'event', publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', eventName: 'trial_started', properties: [{ key: 'plan', value: 'pro' }], email: 'private@example.com' };
    runCode(mockData);
    assertApi('callInWindow').wasCalledWith('SiteOSAnalyticsLoader.track', mockData.publicKey, 'trial_started', { plan: 'pro' });
    assertApi('injectScript').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Script load failure reports failure
  code: |-
    mock('injectScript', (url, ready, failed) => failed());
    const mockData = { mode: 'init', publicKey: 'ana_abcdefghijklmnopqrstuvwxyz', runtimeUrl: 'https://app.siteos.sh/analytics.js' };
    runCode(mockData);
    assertApi('callInWindow').wasNotCalled();
    assertApi('gtmOnFailure').wasCalled();

___NOTES___
SiteOS Analytics template v1. Import under Templates > Tag Templates > New > Import. Use Initialization - All Pages after your CMP sets defaults. With an external CMP, enable Use external consent manager and fire Initialize / update consent on every choice change, including refusal and withdrawal. Do not add a consent requirement that prevents the withdrawal tag from executing. Leave external consent off for standalone Analytics or the matching published SiteOS Cookie integration. Denial prevents detailed collection and custom events; published anonymous pageviews and minimal realtime may continue. GPC, DNT and full opt-out block both paths. Sequence event tags after initialization, fire on confirmed business actions, and verify actual delivery in Analytics. Tag success confirms execution, not durable event delivery. Install Analytics once. Gallery availability is confirmed only by an actual listing. Documentation: https://github.com/pixel-point/siteos-gtm-analytics#installation
