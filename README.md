# ChouTiXiaoGuo
抽屉效果，代码写的烂，主要是讲方法，看完后能自己写一个才是真的有用

* 继承父类 

	```
	ChouTiXiaoGuoViewController
	```

* 设置抽屉 view 宽度 

	```
	#define choutiWidth 150	
	```


* 抽屉 view 添加为 keyWindow 子控件

	```
	[[UIApplication sharedApplication].keyWindow addSubview:slide.view];
	```
	
* 如果有 navigationController 

	```
	self.navigationController.view.frame = [self frameWithOffsetX:offsetX];
	```
	
* 如果有 tabBarController

	```
	self.tabBarController.view.frame = [self frameWithOffsetX:offsetX];
	```