sub init()
  m.top.functionname = "request"
  m.top.response = ""
end sub

function request()
    url = m.top.url
    http = createObject("roUrlTransfer")
    http.setUrl(url)
    http.PostFromString("a=a")
end function
