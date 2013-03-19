$schema: "http://json-schema.org/draft-04/schema#"
id: "http://susestudio.com/api/schema/appliance-configuration#"
type: "object"

defs:

  arch:
    type: "string", enum: ['i686', 'x86_64']

  autostart:
    type: "object"
    properties:
      command:      type: "string"
      description:  type: "string"
      enabled:      type: "boolean"
      user:         type: "string"

  "database-settings":
    type: "object"
    properties:
      users:
        type:         "array"
        uniqueItems:  yes
        items: $ref:  "#/defs/database-user"

  "database-user":
    type: "object"
    properties:
      login:    type: "string"
      password: type: "string"
      databases:
        type:         "array"
        uniqueItems:  yes
        items: type: "string"

  "firewall-settings":
    type: "object"
    properties:
      enabled: type: "boolean"
      "open-ports":
        type:         "array"
        uniqueItems:  yes
        items:        $ref: "#/defs/network-port"

  issue:
    type: "object"
    properties:
      type: type: "string", enum: ['error', 'warning']
      text: type: "string"
      solution:
        type: "object"
        properties:
          type:     type: "string"
          text:     type: "string"
          package:  type: "string"

  "locale-settings":
    type: "object"
    properties:
      "keyboard-layout":  type: "string"
      language:           type: "string"
      timezone:
        type: "object"
        properties:
          location: type: "string"

  "network-settings":
    type: "object"
    properties:
      type:
        type: "string"
        enum: [
          "ask_on_first_boot"
          "dhcp"
          "manual"
          "network_manager"
        ]
        default: "dhcp"

  package:
    type: "object"
    properties:
      name:     type: "string"
      repository: "TBD"

  pattern:
    type: "object"
    properties:
      name:     type: "string"
      repository: "TBD"

  "network-port":
    type: "integer"
    minimum: 1

  repository:
    type: "object"
    properties:
      uri:      $ref: "#/defs/uri"
      name:     type: "string"
      trusted:  type: "boolean", default: yes

  script:
    type: "object"
    properties:
      enabled: type: "boolean"
      script:  type: "string"

  tags:
    type: "array"
    uniqueItems: yes
    items:      $ref: "#/defs/tag"

  tag:
    type: "string"

  uri:
    type: "string", format: "uri"

  user:
    type: "object"
    properties:
      id:       type: "integer", minimum: 0
      login:    type: "string"
      password: type: "string"
      shell:    type: "string"
      homedir:  type: "string"

properties:

  uri:          $ref: "#/defs/uri"
  name:         type: "string"
  icon:         $ref: "#/defs/uri"
  "icon-data":  $ref: "#/defs/uri"
  gallery:      $ref: "#/defs/uri"
  homepage:     $ref: "#/defs/uri"
  arch:         $ref: "#/defs/arch"
  tags:         $ref: "#/defs/tags"
  locale:       $ref: "#/defs/locale-settings"
  network:      $ref: "#/defs/network-settings"
  firewall:     $ref: "#/defs/firewall-settings"

  "based-on":
    type: "object"
    properties:
      uri:    $ref: "#defs/uri"
      name:   type: "string"

  owner:
    type: "object"
    properties:
      uri:          $ref: "#/defs/uri"
      name:         type: "string"
      icon:         $ref: "#/defs/uri"
      "icon-data":  $ref: "#/defs/uri"

  users:
    type: "array", items: $ref: "#/defs/user"

  eulas:
    type: "array", items: type: "string"

  databases:
    type: "object"
    patternProperties:
      "^(mysql|pgsql)$": $ref: "#/defs/database-settings"

  autostarts:
    type:         "array"
    uniqueItems:  yes
    items:        $ref: "#/defs/autostart"

  settings:
    # these are in MB
    memory_size:      type: "integer"
    disk_size:        type: "integer"
    swap_size:        type: "integer"

    PAE:              type: "boolean"
    Xen_DOM0:         type: "boolean"
    cdrom_enabled:    type: "boolean"
    webyast_enabled:  type: "boolean"
    public_clonable:  type: "boolean"
    runlevel:         type: "integer", minimum: 1, maximum: 5
    autologin:        type: "string"

  LVM:
    type: "object"
    properties:
      enabled: type: "boolean"
      group:   type: "string"
      comprising:
        type: "object"
        patternProperties:
          "^/.*": type: "integer", minimum: 1

  scripts:
    type: "object"
    properties:
      autoyast: $ref: "#/defs/script"
      boot:     $ref: "#/defs/script"
      build:    $ref: "#/defs/script"

  software:
    properties:
      packages:
        type: "array", items: $ref: "#/defs/package"
      patterns:
        type: "array", items: $ref: "#/defs/pattern"
      repositories:
        type: "array", items: $ref: "#/defs/repository"

  "slms-cert": type: "string"

  "shared-with":
    type: "array"
    uniqueItems: yes
    items: type: "string"

  issues:
    type: "array", items: $ref: "#/defs/issue"
