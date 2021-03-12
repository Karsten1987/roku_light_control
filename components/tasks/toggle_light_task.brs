sub init()
  m.top.functionname = "request"
end sub

function request()
    url = m.top.url + "/toggle"
    http = createObject("roUrlTransfer")
    http.setUrl(url)
    http.PostFromString("a=a")
end function
