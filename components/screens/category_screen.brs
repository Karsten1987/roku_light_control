function init()
    m.category_list=m.top.findNode("category_list")
    m.category_list.setFocus(true)
    m.category_list.visible = false
    m.category_list.observeField("itemSelected", "onCategorySelected")
    initialize_checklist()
end function

sub onCategorySelected(obj)
    ? "onCategorySelected field: ";obj.getField()
    ? "onCategorySelected data: ";obj.getData()
    ? "onCategorySelected checkedItem: ";m.category_list.checkedItem
    ? "onCategorySelected selected ContentNode: ";m.category_list.content.getChild(obj.getData())

    item = m.category_list.content.getChild(obj.getData())
    toggle_light(item.feed_url)
end sub

sub toggle_light(url)
  m.toggle_task = createObject("roSGNode", "toggle_light_task")
  m.toggle_task.url = url
  m.toggle_task.control = "RUN"
end sub

sub initialize_checklist()
  urls = []
  for i=0 to m.category_list.content.getChildCount()-1
    item = m.category_list.content.getChild(i)
    ? "ohh baby: ";item.feed_url
    urls.push(item.feed_url)
  end for
  ' for each url in urls
  '   ? "extract url: ";url
  ' end for
  m.status_task = createObject("roSGNode", "status_light_task")
  m.status_task.urls = urls
  m.status_task.observeField("status", "onStatusResponse")
  m.status_task.control = "RUN"
end sub

sub onStatusResponse(obj)
  response = obj.getData()
  m.category_list.checkedState = response
  m.category_list.visible = true
end sub
