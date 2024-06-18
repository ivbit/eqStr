#! /bin/sh
# the next line restarts using tclsh \
exec tclsh "$0" ${1+"$@"}

# /bin/sh executes tclsh with arguments, if any.
# If there are no arguments, first argument $1 is unset in sh.
# If first argument $1 is set, 'sh' replaces it with all arguments $@.
# tclsh interprets backslash as continuation of the comment string, sh does not.

# man tclsh

# Intellectual property information START
# 
# Copyright (c) 2024 Ivan Bityutskiy
# 
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
# 
# Intellectual property information END
 
# Description START
# 
# The script compares 2 strings, case-sensitive.
#
# Description END

set cRed "\x1b\[38;5;124m"
set cGreen "\x1b\[38;5;28m"
set cNormal "\x1b\[0m"
# Ask user to input the string
puts -nonewline "\nStr 1: "
flush stdout
set str1 [string trim [gets stdin]]
puts -nonewline "Str 2: "
flush stdout
set str2 [string trim [gets stdin]]

if {[string equal $str1 $str2]} {
  puts "\n${cGreen}Equal${cNormal} (case-sensitive).\n"
  exit 0
} else {
  puts "\n${cRed}Not equal${cNormal} (case-sensitive).\n"
  exit 1
}

# END OF SCRIPT

