# ChouTiXiaoGuo
抽屉效果

* 抽屉效果有很多种，这个是跟 知乎日报 类似的
* 之前一直做不出来，下午查了一下弄好了
* 有两个关键点
  * 抽屉 view 添加在 keyWindow 下
  
  `[[UIApplication sharedApplication].keyWindow addSubview:slide.view];`
  * 移动 view 时移动的是导航栏下的 view
  
  `self.navigationController.view.frame = [self frameWithOffsetX:offsetX];`
