$schema: "http://json-schema.org/draft-04/schema#"
id: "http://susestudio.com/api/schema/appliance-description-brief#"
type: "object"

defs:
  arch:
    type: "string", enum: ['i686', 'x86_64']
  counter:
    type: "integer", minimum: 0
  repository:
    type: "object"
    properties:
      uri:      $ref: "#/defs/uri"
      name:     type: "string"
      trusted:  type: "boolean", default: yes
  uri:
    type: "string", format: "uri"

properties:
  uri:         $ref: "#/defs/uri"
  name:        type: "string"
  icon:        $ref: "#/defs/uri"
  "icon-data": $ref: "#/defs/uri"
  gallery:     $ref: "#/defs/uri"
  homepage:    $ref: "#/defs/uri"
  arch:        $ref: "#/defs/arch"
  downloads:   $ref: "#/defs/counter"
  clones:      $ref: "#/defs/counter"
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
  # images: ...
  software:
    properties:
      patterns: $ref: "#/defs/counter"
      packages: $ref: "#/defs/counter"
      repositories:
        type: "array", items: $ref: "#/defs/repository"
