#!perl

$g_cfg = {
	#titleNo => 1
};

$lang = undef;
$file = $ARGV[-1];
foreach (@ARGV) {
	if (/--language-force=(\w+)/) {
		$lang = $1;
	}
}

if ($lang) {
	if ($lang eq 'markdown') {
		handleMarkdown($file);
		exit();
	}
	elsif ($lang eq 'wiki') {
		handleMarkdown($file, 1);
		exit();
	}
}

$ln = join(' ', @ARGV);
# open OUT, ">d:/test/1.log";
# print OUT "$ln\n";
# close OUT;
exec "ctags " . $ln;

sub handleMarkdown # ($file, $isWiki)
{
	my ($file, $isWiki) = @_;
	@stack = ();
	$level = 0;

	open IN, $file;
	$lineno = 1;

	# 首行当作标题不处理
	<IN>;

	$char = $isWiki? "=": "#";
	while (<IN>) {
		chomp;
		++ $lineno;
		if (/^($char+)\s+(.*?)(\s*=+)?$/) {
			$level1 = length($1);
			while (@stack > 0 && $stack[-1]{level} > $level1) {
				pop @stack;
			}
			if (@stack == 0 || $stack[-1]{level} < $level1) {
				push @stack, {level => $level1, no => 1};
			}
			else {
				++ $stack[-1]->{no};
			}
			$no = join(".", map { $_->{no} } @stack);
			#$tag = "." x $level1 . $2;
			#$tag = "." x $level1 . $no . ". " . $2;
			$tag = $no . ". " . $2;
			print "$tag\tfile\t/^$_\$/;\"\th\tline:$lineno\n"
		}
	}
	close IN;
}
