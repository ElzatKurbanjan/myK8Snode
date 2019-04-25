## 版本信息
当前Kubernetes版本其实为1.14.x版本

但为了能让kubelet和kubeadm兼容，我将其改为了1.13.1版本（具体信息可查看./pkg/version/base.go文件）

## 代码结构
cmd目录：构建层，组件的构建从该目录下开始，可以在该目录下的相应组建目录下执行go build指令来构建相应组建

pkg目录：逻辑层，主要逻辑的实现代码

其余两个目录：调用的外部代码资源

## 当前进度

Kubelet:
已删除部分：
Cloud Provider，
CSI 中关于Cloud Provider 部分的支持部分，
SubPath 特性，
Runtime Class 特性，
DebugContainers特性，
SCTPSupport特性，
NodeLease特性


kube-proxy:
已删除：
update watcher,
errCh
