## Unreleased

- Reflect ownership transfer https://github.com/wantedly/open_api/pull/16

## 0.6.1
- Fix `Paths` initializer to enable to take no args
## 0.6.0
- Supported Ruby 3.0 by fixing keyword parameters
- Relaxed the version constraint on Rails
## 0.5.0
- Allow using with rails 6

## 0.3.4
* Fix to use array object for "propaties" of Schema

## 0.3.3
* Follow nil case of extra fields in Schema

## 0.3.2
* Fix minor bug

## 0.3.1
* Keep hash keys to be string

## 0.3.0
* Add `#serializable_hash` to Components
* Allow Paths and Responses to set like a hash
* Fallback to string when it has no serializable way

## 0.2.0
* Allow Schema to behave like OpenStruct 5a698cf796f0467b726062bcd7c2cf2c20693950
* Allow to serialize `schema.properties` fb6f2a0a5d58de7c0bfb113b3a6636a50df7de3d
* Fix dir for `open_api/schema` 1e8d9ffcccd89d89844af7eecb418e352ad6b5f3


## 0.1.0
First release

* Implement all classes for OpenAPI v3.0.1
* Allow to YAML serializing/deserializing
