xi(sigma)   = sigma*sqrt(-2.0*log(rand(0)))*sin(2.0*pi*rand(0))

i_max  = 2
j_max  = 3500
D1     = 3.2
D2     = 1.5
D3     = 0.5
t      = 0.0
dt     = 0.1
sigma1 = sqrt(2*D1*dt)
sigma2 = sqrt(2*D2*dt)
sigma3 = sqrt(2*D3*dt)
color0 = "#222831"
color1 = "#393e46"
color2 = "#dddddd"
color3 = "#00adb5"

array X1[j_max] ; do for [j=1:j_max] {X1[j]=2}
array Y1[j_max] ; do for [j=1:j_max] {Y1[j]=0}
array X2[j_max] ; do for [j=1:j_max] {X2[j]=2.6}
array Y2[j_max] ; do for [j=1:j_max] {Y2[j]=0.4}
array X3[j_max] ; do for [j=1:j_max] {X3[j]=1.5}
array Y3[j_max] ; do for [j=1:j_max] {Y3[j]=-0.9}

set size ratio 0.5 1
set tmargin 0
set lmargin 0
set rmargin 0
set bmargin 0
unset border
unset label
unset tics
unset key
set xrange[-6:6]
set yrange[-3:3]

do for [i = 0:i_max] {
	t = t + dt
	do for [j = 1:j_max] {
		X1[j] = X1[j] + xi(sigma1)
		Y1[j] = Y1[j] + xi(sigma1)
		X2[j] = X2[j] + xi(sigma2)
		Y2[j] = Y2[j] + xi(sigma2)
		X3[j] = X3[j] + xi(sigma3)
		Y3[j] = Y3[j] + xi(sigma3)
	}
}

set terminal pngcairo enhanced background color0 size 1280,640
set output sprintf("%s.png",ARG0[1:strlen(ARG0)-4])
plot \
Y1 using (X1[$1]):2 with points pt 7 ps 1 lc rgb color1 notitle,\
Y2 using (X2[$1]):2 with points pt 7 ps 0.6 lc rgb color2 notitle,\
Y3 using (X3[$1]):2 with points pt 7 ps 0.5 lc rgb color3 notitle
set out