export getdigits, touppercase, firstnorm, secondnorm, infnorm, isleap, chesscolor

function getdigits(a)
    chisla = [];
    num = a;
    while (num/10) > 1
        push!(chisla, num%10);
        num = num÷10;
    end
    push!(chisla, num);
    return chisla[end:-1:1];
end

function touppercase(str_)
    s=""
    println(s)
    for simv in str_
        if 'a'<=simv<='z'
             nsimv=Char(Int(simv)-Int('a')+Int('A'))
             s *= nsimv
        else
            s *= simv
        end
    end
    return s 
end

function firstnorm(vec_::AbstractVector{<:Number})
   norm=0
   for i in vec_
    norm += abs(i)
   end
   return norm
end

function secondnorm(vec_::AbstractVector{<:Number})
    norm=0
    for i in vec_
        norm += (i^2)
    end
    norm = sqrt(norm)
    return norm
end        

function infnorm(vec_::AbstractVector{<:Number})
    norm=0
    for i in vec_
        if (i>norm) 
            norm=i
        end
    end
    return norm
end

function firstnorm(mat_::AbstractMatrix{<:Number})
    sumcol=0
    rows, cols = size(mat_)
    vecsumcol = Array{Any}(undef, 1, cols)
    for j =1:cols
        for i =1:rows
            sumcol+=mat_[i,j]
        end
        vecsumcol[j]=sumcol
        sumcol=0
    end
   maxsum=0
    for i in vecsumcol
         if i>maxsum
            maxsum = i
         end
    end
   return maxsum
end

function infnorm(mat_::AbstractMatrix{<:Number})
   sum1=0
   for col in eachrow(mat_)
        sum = 0
        for j in col
            sum+=j;
        end
        if sum>sum1
            sum1=sum
        end
    end
    return (sum1)
end

function isleap(year)
    if year%400==0 return true
    elseif year%100==0 return false
    elseif year%4==0 return true
    else
        return false
    end
end

function chesscolor(cell1, cell2)
    num1=Int(cell1[1])-Int('a')
    num2=Int(cell2[1]-Int('a'))

if ((cell1[2]+num1)%2==(cell2[2]+num2)%2) return true
else return false
end
end