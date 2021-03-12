sub init()
  m.top.functionname = "request"
  m.top.status = []
end sub

function request()
  status = []
  http = createObject("roUrlTransfer")
  for each u in m.top.urls
    url = u + "/status"
    http.setUrl(url)
    response = http.GetToString()
    if response = "ON"
      status.push(true)
    else
      status.push(false)
    end if
  end for
  m.top.status = status
end function
