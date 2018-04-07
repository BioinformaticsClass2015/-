
function Gold(f,l0,r0,ϵ=0.01)   ##p=0.618
    n = ceil(log(ϵ/2)/log(0.61803))
    
    ##判断输入;
    if l0<r0
        l = l0
        r = r0
    else
        if l0>r0
            l = r0
            r = l0
        else
            println("ERROR!")
        end
    end
    
    ##黄金分割算法;
    ltmp = l + (1-0.61803)*(r-l)
    rtmp = l + 0.61803*(r-l)
    fl = f(ltmp)
    fr = f(rtmp)
    for i = 1:n
        if fl > fr
            l = ltmp
            r = r
            fl = fr
            rtmp = l + 0.61803*(r-l)
            fr = f(rtmp)
        else
            l = l
            r = rtmp
            fr = fl
            ltmp = l + (1-0.61803)*(r-l)
            fl = f(ltmp)
        end
    end
    return l,r
end

Gold(x->x^4-14x^3+60x^2-70x,0,2,0.3)

function Fibonacci(f,l0,r0,ϵ1,ϵ2=0.05)
    threshold = abs(l0-r0)*(1+2*ϵ2)/ϵ1
    
    ##判断输入;
    if l0<r0
        a = l0
        b = r0
    else
        if l0>r0
            a = l0
            b = r0
        else
            println("ERROR!")
            end
    end
    
    ##建立数组;
    fib = [1,2]
    n = 3
    current = fib[n-1]+fib[n-2]
    while current<threshold
        push!(fib,current)
        n+=1
        current=fib[n-1]+fib[n-2]
    end
    push!(fib,current)
    N=n-1
    fib=sort(fib,1,rev=true)
    
    for i=1:N
        if i==N
            p=1-fib[i+1]/fib[i]-ϵ2
        else
            p=1-fib[i+1]/fib[i]
        end
        l = a+p*(b-a)
        r = a+(1-p)*(b-a)
        fl = round(f(l),2)
        fr = round(f(r),2)
        if f(l)<f(r)
            b = r
        else
            a = l
        end
    end
    return fib,a,b
end

Fibonacci(x->x^4-14x^3+60x^2-70x,0,2,0.3,0.05)

function Binary_Search(f,g,l0,r0,e=0.01)
    n = ceil(log(abs(l0-r0)/e)/log(2))
    if l0<r0
        l = l0
        r = r0
    else
        if l0>r0
            l = r0
            r = l0
        else
            println("ERROR!")
        end
    end
    m = (l+r)*0.5
    for i = 1:n
        gm = g(m)
        if abs(gm) == 0
            return m,f(m)
        else
            if gm < 0
                l = m
            else
                r = m
            end
        end
        m = (l+r)*0.5
    end
    return m,f(m)
end

Binary_Search(x->x^4-14x^3+60x^2-70x,x->4x^3-42x^2+120x-70,0,2,0.1)

Binary_Search(x->x^2,x->2*x,-1,1,0.01)
