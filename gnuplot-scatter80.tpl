# Let's output to a jpeg file
set terminal jpeg size 800,800
# This sets the aspect ratio of the graph
set size 1, 1
# The file we'll write to
set output "timeseries-lowsplit.jpg"
# The graph title
set title "Benchmark testing"
# Where to place the legend/key
set key left top
# Draw gridlines oriented on the y axis
set grid y
# Specify that the x-series data is time data
set xdata time
# Specify the *input* format of the time data
set timefmt "%s"
# Specify the *output* format for the x-axis tick labels
set format x "%S"
# Label the x-axis
set xlabel 'seconds'
# Label the y-axis
set ylabel "response time (ms)"
# Tell gnuplot to use tabs as the delimiter instead of spaces (default)
set datafile separator '\t'
# Plot the data
plot "80contact-edit20181127032031-arrayc5a100.tsv" every ::2 using 2:6 lc rgb "#5DBCD2" title 'array1, concurrency 5' with points, \
"80contact-edit20181127032633-arrayc5a100.tsv" every ::2 using 2:6 lc rgb "blue" title 'array2, concurrency 5' with points, \
"80contact-edit20181127032838-arrayc5a100.tsv" every ::2 using 2:6 title 'array3, concurrency 5' with points, \
"80contact-edit20181127033532-arrayc1a100.tsv" every ::2 using 2:6 lc rgb "#032C60" title 'array4, concurrency 1' with points, \
"80contact-edit20181127034442-arrayc1a100.tsv" every ::2 using 2:6 lc rgb "#2687B1" title 'array5, concurrency 1' with points, \
"80contact-edit20181127035544-arrayc1a100.tsv" every ::2 using 2:6 lc rgb "#066AA5" title 'array6, concurrency 1' with points, \
"80contact-edit20181127040720-redisc5a100.tsv" every ::2 using 2:6 lc rgb '#F3D292' title 'redis6, concurrency 5' with points, \
"80contact-edit20181127040930-redisc5a100.tsv" every ::2 using 2:6 lc rgb '#FD9C55' title 'redis6, concurrency 5' with points, \
"80contact-edit20181127041114-redisc5a100.tsv" every ::2 using 2:6 lc rgb '#E96C2A' title 'redis6, concurrency 5' with points, \
"80contact-edit20181127041758-redisc1a100.tsv"  every ::2 using 2:6 lc rgb '#FDE9B1' title 'redis6, concurrency 5' with points, \
"80contact-edit20181127042735-redisc1a100.tsv"  every ::2 using 2:6 lc rgb '#E6965C' title 'redis6, concurrency 5' with points, \
"80contact-edit20181127043718-redisc1a100.tsv"  every ::2 using 2:6 lc rgb '#804919' title 'redis6, concurrency 5' with points,