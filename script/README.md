组件的手工精简已基本完成。

但是发现还有很多alpha特性可以精简，并且可以采用脚本实现半自动化的裁剪工作，故使用该目录下的脚本代码以实现半自动化裁剪。

1.首先，写了一个delete_test.sh脚本用来将所有的测试文件删除，以便后续搜索文件内容时减少内存开销。
用法： delete_test.sh 目录名

2.find_features_use.sh

K8S在添加features时，首先需要在pkg/features/features.go文件下构造features,然后在需要使用该features的相应组件的结构体中增加这一特性，最后在需要使用该features时做一个判断，即判断该features是否被enable，所以在删除某一features时可以利用这一特点，在所有.go文件中查找是否有查询该features是否被enable的语句，将其删去即可。

需要注意的是，将所有查询语句删去之后，编译时会引起相应的包被引入但未被使用的错误，此时同样删去此包的引入（想删的更彻底甚至可以直接将该包从项目中删除）。

同时还需要注意，该方法只能删除较大组件相关特性，但是某些组件可能还会有很多小的部分，在删除了相应查询语句后，可能会引发这些小部分组件中的某一特性被定义但未被使用的错误，此时仍需要手动删除该部分。

用法： find_features_use.sh 目录名 特性名

3.find_features_pkg.sh

删除相应的代码后，需要将import的包删除，利用该脚本可查找所有引用该features的包的文件，查找后需要人工鉴别哪些是自己需要精简的组建的目录下的文件。

用法： find_features.pkg.sh 目录名 特性名

4.find_features_def.sh

所有的features在使用时都会先在使用该features的组件结构体中定义该features，故利用该脚本找到组件中的features的定义位置。

注意该脚本可能会匹配出一些不需要修改的部分，需要自行鉴别。

用法： find_features_def.sh 目录名 特性名

