local function MainUI()
  local dialog -- 创建一个名叫dialog的变量，用于创建对话框
  dialog = GUI.createDialog{ -- 创建对话框
    icon = Icon.SETTINGS, -- 为对话框设置图标
    title = 'Title',  -- 对话框的标题      
    text = 'Text', -- 对话框的描述    
    width = 180,            
    height = 100, -- 这两个是对话框的尺寸       
    closeable = true, -- 设置是否可以通过点击空白区域和红色×来关闭对话框   
    pause = true, -- 设置对话框打开时游戏是否暂停          
    onUpdate = function() end, -- 当对话框被调出时不断进行的操作
    onCancel = function() end, -- 当“取消”按钮按下时的操作
    onClose = function() end, -- 当对话框关闭时的操作
    actions = {
      {
        icon = Icon.CANCEL, -- “取消”按钮的图标
        text = Translation.control_cancel, -- “取消”按钮的文字
        autoClose = true -- 当按下时对话框自动关闭
      },
      {
        id = '$cmdCancel', -- 此按钮的id
        icon = Icon.OK, --“好的”按钮的图标
        text = Translation.control_ok, -- “好的”按钮的文字
        onClick = function() -- 当按钮按下时的操作
          Debug.toast("Hello, world!") -- 显示一段文字“Hello, world!”
        end,           
        golden = true -- 设置按钮为金色
      }
    }
  }
  closeDialog = dialog.close
end

-- 以下时对话框的必要内容
function script:init()
  if closeDialog then
      closeDialog()
      closeDialog = nil
      MainUI()
  end
end

function script:event(_, _, _, event)
  if event == Script.EVENT_TOOL_ENTER then
      GUI.get('cmdCloseTool'):click()
      MainUI()
  end
end
