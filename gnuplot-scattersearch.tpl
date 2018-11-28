# Let's output to a jpeg file
set terminal jpeg size 800,800
# This sets the aspect ratio of the graph
set size 1, 1
# The file we'll write to
set output "timeseriesSearch.jpg"
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
plot "contact-search20181127233500-arrayc1a100.tsv" every ::2 using 2:6 lc rgb "#5DBCD2" title 'array1, concurrency 1' with points, \
"contact-search20181127234400-arrayc1a100.tsv" every ::2 using 2:6 lc rgb "blue" title 'array2, concurrency 1' with points, \
"contact-search20181127235248-arrayc1a100.tsv" every ::2 using 2:6 title 'array3, concurrency 1' with points, \
"contact-search20181128000427-arrayc5a100.tsv" every ::2 using 2:6 lc rgb "#032C60" title 'array4, concurrency 5' with points, \
"contact-search20181128000640-arrayc5a100.tsv" every ::2 using 2:6 lc rgb "#2687B1" title 'array5, concurrency 5' with points, \
"contact-search20181128000848-arrayc5a100.tsv" every ::2 using 2:6 lc rgb "#066AA5" title 'array6, concurrency 5' with points, \
"contact-search20181128001151-mixedc1a100.tsv" every ::2 using 2:6 lc rgb '#F3D292' title 'Mixed, concurrency 1' with points, \
"contact-search20181128002110-mixedc1a100.tsv" every ::2 using 2:6 lc rgb '#FD9C55' title 'Mixed, concurrency 1' with points, \
"contact-search20181128003339-mixedc1a100.tsv" every ::2 using 2:6 lc rgb '#E96C2A' title 'Mixed, concurrency 1' with points, \
"contact-search20181128004757-mixedc5a100.tsv"  every ::2 using 2:6 lc rgb '#FDE9B1' title 'Mixed, concurrency 5' with points, \
"contact-search20181128004930-mixedc5a100.tsv"  every ::2 using 2:6 lc rgb '#E6965C' title 'Mixed, concurrency 5' with points, \
"contact-search20181128005113-mixedc5a100.tsv"  every ::2 using 2:6 lc rgb '#804919' title 'Mixed, concurrency 5' with points, \
"contact-search20181128005442-redisc1a100.tsv" every ::2 using 2:6 lc rgb '#85D9BF' title 'Redis, concurrency 1' with points, \
"contact-search20181128010508-redisc1a100.tsv" every ::2 using 2:6 lc rgb '#028910' title 'Redis, concurrency 1' with points, \
"contact-search20181128011218-redisc1a100.tsv" every ::2 using 2:6 lc rgb '#AEF35A' title 'Redis, concurrency 1' with points, \
"contact-search20181128012003-redisc5a100.tsv"  every ::2 using 2:6 lc rgb '#5B7F35' title 'Redis, concurrency 5' with points, \
"contact-search20181128012207-redisc5a100.tsv"  every ::2 using 2:6 lc rgb '#5B7F35' title 'Redis, concurrency 5' with points, \
"contact-search20181128012207-redisc5a100.tsv"  every ::2 using 2:6 lc rgb '#98BF64' title 'Redis, concurrency 5' with points,

