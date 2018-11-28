# output as png image
set terminal png
 
# save file to "benchmark.png"
set output "benchmark.png"
 
# graph title
set title "Apache Benchmark for loading contact edit on low volume contact"
 
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
"contact-edit2.tsv" using 10 smooth sbezier with lines title "Benchmark 2:", \
"contact-edit3.tsv" using 10 smooth sbezier with lines title "Benchmark 3:", \
"contact-editr1.tsv" using 10 smooth sbezier with lines title "Redis 1:", \
"contact-editr2.tsv" using 10 smooth sbezier with lines title "Redis 2:", \
"contact-editr3.tsv" using 10 smooth sbezier with lines title "Redis 3:", \
"contact-editr1c1.tsv" using 10 smooth sbezier with lines title "Redis no concurrency:", \
"contact-editr2c1.tsv" using 10 smooth sbezier with lines title "Redis no concurrency:", \
"contact-editr3c1.tsv" using 10 smooth sbezier with lines title "Redis no concurrency:"
