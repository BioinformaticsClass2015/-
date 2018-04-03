#####二分法#####
f<-function(x)
{
  y<-(x^4-14*x^3+60*x^2-70*x)
}

g<-function(x)
{
  y<-(4*x^3-53*x^2+120*x-70)
}

half_div<-function(a0,b0,esp)#b0>a0
{
  N<-ceiling(log((esp/2),0.5))
  for(i in 1:N)
  {
    c<-(a0+b0)/2
    if(g(c)>0)
    {b0<-c}
    if(g(c)<0)
    {a0<-c}
  }
  print(a0)
  print(b0)
}

half_div(0,2,0.003)

#####黄金分割法#####
f<-function(x)
{
  y<-(x^4-14*x^3+60*x^2-70*x)
}

godlen<-function(a0,b0,esp)#b0>a0
{
  N<-ceiling(log(esp/(b0-a0),1-((3-sqrt(5))/2)))
  for (i in 1:N)
  {
    p<-(3-sqrt(5))/2
    a1<-a0+p*(b0-a0)
    b1<-a0+(1-p)*(b0-a0)
    fa1<-f(a1)
    fb1<-f(b1)
    if (fa1<fb1)
    {b0<-b1}
    else if (fa1>fb1)
    {a0<-a1}
  }
  print(a0)
  print(b0)
}

godlen(0,2,0.003)

#斐波那契法
f<-function(x)
{
  x1<-1
  x2<-2
  if(x==1)
  {
    return(1)
  }
  if(x==2)
  {
    return(2)
  }
  if(x>2)
  {
    for(i in 1:(x-2))
    {
      x3<-x1
      x1<-x2
      x2<-x3+x2
    }
    return(x2)
  }
}

fibonacci<-function(a0,b0,esp)#b0>a0
{
  n<-2/esp
  x<-1
  while(f(x)<n)
  {
    x<-x+1
  }
  if(f(x)>=n)
  {
    q<-x-1
  }
  for(i in 1:(q-1))
  {
    c0<-a0+(1-f(q)/f(x))*(b0-a0)
    d0<-a0+f(q)/f(x)*(b0-a0)
    r<-q
    x<-q
    q<-r-1
    a1<-f(c0)
    b1<-f(d0)
    if(a1<b1)
    {
      b0<-d
    }
    if(a1>b1)
    {
      a0<-c0
    }
  }
  c0<-a0+0.45*(b0-a0)
  d0<-a0+0.55*(b0-a0)
  a1<-f(c0)
  b1<-f(d0)
  if(a1<b1)
  {
    b0<-d0
  }
  if(a1>b1)
  {
    a0<-c0
  }
  print(a0)
  print(b0)
}

fibonacci(0,2,0.003)
