hiera_include("classes")

node 'stor-pri-01' {
  include ldapclient
}

node default {
}

