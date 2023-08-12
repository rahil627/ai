use strict;
use warnings;

sub render_markup {
    my ($text) = @_;

    my @markup_tags = (
        [qr/\[title\](.*?)\[\/title\]/, "\e[33;1m$1\e[0m"],     # Yellow bold text
        [qr/\[emphasis\](.*?)\[\/emphasis\]/, "\e[31;1m$1\e[0m"] # Red bold text
    );

    foreach my $tag (@markup_tags) {
        my ($regex, $replacement) = @{$tag};
        $text =~ s/$regex/$replacement/g;
    }

    return $text;
}

sub main {
    my $input_filename = "input.txt";
    open(my $file, '<', $input_filename) or die "File '$input_filename' not found.";

    local $/; # Slurp mode
    my $content = <$file>;
    close($file);

    my $rendered_content = render_markup($content);
    print $rendered_content;
}

main();
