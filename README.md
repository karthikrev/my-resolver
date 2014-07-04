my-resolver
===========

This is a wrapper cookbook reusing the community's sudo cookbook https://github.com/opscode-cookbooks/resolver

Why I needed this,
---
1. Our org has multiple search domains in resolv.conf  <-> Community cookbook allows only one
2. "domain" field is a must.
    - Domain are not set sometimes in servers.
    - This cookbook considers user provided domain, if not given, it considers node['domain'] if that also is not given then the field "domain" is discarded.

Usage
------

If you are  using role (not recommended)
```
"resolver" : {
    "nameservers" : [ "8.8.8.8", "4.2.2.2" ],
    "domain": "myhome.com",
    "search" : [ "myhome.com", "another.domain.com", "yetanother.domain.com" ],
    "options" : {
        "timeout" : 2
    }
}
```

or directly using the wrapper cookbook's attributes,
```
default['resolver']['search'] = [ "myhome.com", "another.domain.com", "yetanother.domain.com" ]
default['resolver']['domain'] = "myhome.com"
default['resolver']['nameservers'] = [ '8.8.8.8', '4.2.2.2' ]
default['resolver']['options'] = { "timeout" => 2  }
default['resolver']['server_role'] = 'nameserver'
```

Result would be
```
search myhome.com another.domain.com yetanother.domain.com
nameserver 8.8.8.8
nameserver 4.2.2.2
options timeout:2
domain myhome.com
```

