# output as png image
set terminal png
 
# save file to "benchmark.png"
set output "benchmark.png"
 
# graph title
set title
"Apache Benchmark for loading contact edit on low volume contact"
 
# aspect ratio for image size
set size 1,1
 
# enable grid on y-axis
set grid y
 
# x-axis label
set xlabel "Request"
 
# y-axis label
set ylabel "Response Time (ms)"
 
# plot data from bench1.tsv,bench2.tsv and bench3.tsv using column 10 with smooth sbezier lines
plot "contact-edit1.tsv" using 10 smooth sbezier with lines title "Benchmark 1:", \
plot "contact-edit20181127032031-arrayc5a100.tsv" every ::2 using 2:4  lc rgb "#5DBCD2" title 'array1, concurrency 5' with lines, \
"contact-edit20181127032633-arrayc5a100.tsv" every ::2 using 2:5 lc rgb "blue" title 'array2, concurrency 5' with lines, \
"contact-edit20181127032838-arrayc5a100.tsv" every ::2 using 2:5 title 'array3, concurrency 5' with lines, \
"contact-edit20181127033532-arrayc1a100.tsv" every ::2 using 2:5 lc rgb "#032C60" title 'array4, concurrency 1' with lines, \
"contact-edit20181127034442-arrayc1a100.tsv" every ::2 using 2:5 lc rgb "#2687B1" title 'array5, concurrency 1' with lines, \
"contact-edit20181127035544-arrayc1a100.tsv" every ::2 using 2:5 lc rgb "#066AA5" title 'array6, concurrency 1' with lines, \
"contact-edit20181127040720-redisc5a100.tsv" every ::2 using 2:5 lc rgb '#F3D292' title 'redis6, concurrency 5' with lines, \
"contact-edit20181127040930-redisc5a100.tsv" every ::2 using 2:5 lc rgb '#FD9C55' title 'redis6, concurrency 5' with lines, \
"contact-edit20181127041114-redisc5a100.tsv" every ::2 using 2:5 lc rgb '#E96C2A' title 'redis6, concurrency 5' with lines, \
"contact-edit20181127041758-redisc1a100.tsv"  every ::2 using 2:5 lc rgb '#FDE9B1' title 'redis6, concurrency 5' with lines, \
"contact-edit20181127042735-redisc1a100.tsv"  every ::2 using 2:5 lc rgb '#E6965C' title 'redis6, concurrency 5' with lines, \
"contact-edit20181127043718-redisc1a100.tsv"  every ::2 using 2:5 lc rgb '#804919' title 'redis6, concurrency 5' with lines,
