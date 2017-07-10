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

安装：

- 复制vimfiles中的目录到vim插件目录。例如vim安装在d:\vim目录下，则一般插件目录为d:\vim\vimfiles。
- 将bin下的文件复制到可执行目录（假如复制到d:\bat为例，该目录已被加入系统缺省执行路径）

以下配置加入vim主配置文件（如d:\vim\_vimrc文件），注意修改 Tlist_Ctags_Cmd一行的文件路径：

	" 使用折叠
	let g:markdown_folding=1

	" markdown + taglist + ctags for markdown/vimwiki
	" !!! 修改这里的路径 !!!
	let Tlist_Ctags_Cmd="perl d:/bat/ctags1.pl"
	let tlist_markdown_settings="markdown;h:标题"
	let tlist_vimwiki_settings="wiki;h:标题"

	" for vimwiki
	let g:vimwiki_html_header_numbering=2
	let g:vimwiki_folding='expr'

建议再加入以下配置：

	" Ctrl-F11打开taglist
	nmap <silent> <C-F11> :TlistToggle<CR>

	" 用1列显示折叠情况
	set foldcolumn=1
	" 标识出隐藏内容
	if has('conceal')
		set conceallevel=1
		set concealcursor=n
	endif

注意：

- 如果原先已带markdown插件，请在ftplugin/syntax目录中删除（或改名）markdown.vim。

- 请检查.md文件是否默认关联到markdown格式。
 某些版本的vim中，"*.md"被关联到modula2文件类型，可打开vim目录下的filetype.vim，搜索"*.md"，如果未正确关联，就将它关联到markdown类型：

		" Markdown
		au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md setf markdown

		" Modula 2 (删除 *.md，如果有的话)
		au BufNewFile,BufRead *.m2,*.DEF,*.MOD,*.mi setf modula2

## 原理

TList插件使用ctags生成tag并显示在左侧。
为了支持markdown/vimwiki格式，自定义了 ctags1.pl 文件来处理Tag。

## 使用

- Ctrl-F11打开目录视图（即Tag List）
- 在vim中用 za 来打开/关闭折叠

vimwiki格式的使用类似。
要安装vimwiki，可找到 dep\vimwiki-lj-1.vmb 用vim打开它，再用 `:so %` 执行安装。

