# StoryBoard Reference
### StoryBoard Reference的介绍
* StoryBoard Reference是Xcode7,iOS9出现的新功能

* 目的是让我们可以更好的使用storyboard来开发项目
    * 在之前的开发中,如果使用一个storyboard开发,那么非常容易造成`git/svn冲突`, 以及storyboard过于庞大导致的不便于管理问题
    * 为了避免这些问题, 在过去需要手动创建多个 Storyboard 文件，并且要写大量的代码方式来解决
    * 为了解决这些问题，在 iOS 9 中苹果介绍了 Storyboard References 这个概念


* 优点:
    * 允许你从 segue 中引用其他 storyboard 中的 viewController
    * 可以将不同模块放到不同Storyboard中
    * 阅读性好
    * 齐头并进, 加快开发效率
    * 不容易出现SVN/GIT错误

### 如何使用StoryBoard Reference
* 方式一:
    * 1.选中需要的控制器
    * 2.点击导航条Editor
    * 3.选择下拉菜单Refactor to storyboard
* 方式二:
    * 1.在控件库中拖入Storyboard References
    * 2.新建一个Storyboard
    * 3.关联新建的storyboard到Storyboard References

### 纯代码和Storyboard如何选择
* Storyboard前期开发速度快
* Storyboard容易重复造轮子
* 纯代码维护方便
