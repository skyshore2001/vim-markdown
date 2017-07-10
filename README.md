# vim支持markdown格式

markdown支持：

- 语法高亮
- 层次折叠
- 目录层次

屏幕截图：

- 用vim+markdown写产品设计文档

	![](screen1.png)

- 用vim+markdown写教程

	![](screen2.png)

- 用vim+vimwiki写产品设计文档

	![](screen3.png)

## 安装

安装要求：

- vim 7+
- vim taglist插件(dep/taglist.vim，复制到vimfiles/plugin目录下)
- perl 5.8+
- ctags.exe (dep/ctags.exe)

安装：

- 复制vimfiles中的目录到vim插件目录。
- 将bin下的文件复制到可执行目录（假如复制到d:\bat为例）
- 以下配置加入vimrc:

	" for taglist
	nmap <silent> <C-F11> :TlistToggle<CR>

	" for markdown plugin
	let g:vim_markdown_folding_style_pythonic = 1
	let g:vim_markdown_toc_autofit = 1
	let g:vim_markdown_emphasis_multiline = 0

	let g:markdown_folding=1

	" markdown + taglist + ctags for markdown/vimwiki
	" !!! 修改这里的路径 !!!
	let Tlist_Ctags_Cmd="perl d:/bat/ctags1.pl"
	let tlist_markdown_settings="markdown;h:标题"
	let tlist_vimwiki_settings="wiki;h:标题"

	" for vimwiki
	filetype plugin on
	let g:vimwiki_html_header_numbering=2
	let g:vimwiki_folding='expr'

## 原理

TList插件使用ctags生成tag并显示在左侧。
为了支持markdown/vimwiki格式，自定义了 ctags1.pl 文件来处理Tag。

## 使用

- Ctrl-F11打开目录视图（即Tag List）
- 在vim中用 za 来打开/关闭折叠

