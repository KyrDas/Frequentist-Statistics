set.seed(123)
lamda = runif(1,min=1, max=3)
data=rpois(300000,lamda)

n=length(data)

sumx=0
for (i in 1:n){
  sumx= sumx + data[i]
}

xbar= sumx/n

#Διάστημα εμπιστοσύνης σημαντικότητας 95%

z = 1.9
d= 4*xbar*(z^2)/n + (z^4)/(n^2)

theta_1 = xbar + z/(2*n)- sqrt(d)/2
theta_2 = xbar + z/(2*n) + sqrt(d)/2

cat("Η εκτίμηση μέγιστης πιθανοφάνειας είναι", xbar, " και το ασυμπτωτικο διαστημα
    εμπιστοσυνης σημαντικότητος 95% ειναι ",
    sprintf("[%f,%f]", theta_1, theta_2))

#Έλεγχος υποθέσεων σημαντικότητας a 
#H_0 = l_0 vs H_1 = l_1

l_0 = xbar
l_1 = theta_2
a = 0.05

ct = 473695 #υπό την H_0,  η αθροιστική συνάρτησης πιθανότητας ισούται με 1- a όταν x = ct
#εδώ χρησιμοποιήθηκε η κανονική προσέγγιση της Poisson
#https://homepage.divms.uiowa.edu/~mbognar/applets/normal.html

if ( sumx > ct){
  print('Απορρίπτουμε την μηδενική υπόθεση')
} else {
  print('Δεχόμαστε την μηδενική υπόθεση')
}









